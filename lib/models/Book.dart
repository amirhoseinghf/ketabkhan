import 'package:flutter/cupertino.dart';

enum Categoryz {
  favorite,
  new_release,
  top_selling,
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
  final String id;
  final String name;
  final String author;
  final Genre genre;
  final int price;
  final Categoryz category;
  final String imageUrl;
  final Type type;
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
}
