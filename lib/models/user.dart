import 'package:flutter/material.dart';

import './book.dart';

class User {
  String email;
  String userName;
  String name;
  String familyName;
  // String profileImageUrl;
  double credit = 0;
  String password;
  List<Book> books = [];
  List<Book> readingBooks = [];
  Image profileImg;
  String profileImgPath;

  User(
      {@required this.email,
      @required this.userName,
      @required this.password,
      this.name,
      this.familyName,
      this.credit = 0});

  Map<String,dynamic> toJson() => {
    'email': this.email,
    'userName': this.userName,
    'name': this.name,
    'familyName': this.familyName,
    'credit':this.credit,
    'profileImgPath': this.profileImgPath,
  };


}



