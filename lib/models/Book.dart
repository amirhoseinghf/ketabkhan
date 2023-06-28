import 'package:flutter/material.dart';

enum Categoryz {
  favorite,
  newRelease,
  topSelling,
}

enum Type {
  ebooks,
  soundBooks
}

enum Genre {
  romance,
  fiction,
  history,
  horror
}

class Book {
  String id;
  String name;
  String author;
  Genre genre;
  int price;
  Categoryz category;
  String imageUrl;
  Type type;
  bool isReadingNow = false;

  Book(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.category,
      @required this.type,
      @required this.imageUrl,
      this.isReadingNow = false,
      this.author,
      this.genre});

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'name': "bookName",
    'author':"bookAuthor",
    'price': this.price,
    'category': this.category.toString(),
    'type':this.type.toString(),
    'imageUrl': "Url",
    'isReadingNow':this.isReadingNow,
    'genre':this.genre.toString(),
  };

    Book.fromJson(Map<String, dynamic> json)
        : id = json['id'],
          name = json['name'],
          author = json['author'],
          price = json['price'],
          category = json['category'],
          type = json['type'],
          imageUrl = json['imageUrl'],
          isReadingNow = json['isReadingNow'],
          genre = json['genre'];

}
