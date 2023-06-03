import 'package:flutter/cupertino.dart';

enum Category {
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
  final Category category;
  final String imageUrl;
  final Type type;
  bool isReadingNow;

  Book(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.category,
      @required this.type,
      @required this.imageUrl,
      this.isReadingNow,
      this.author,
      this.genre});
}
