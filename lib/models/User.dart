import 'package:flutter/material.dart';

import './Book.dart';

class User {
  String email;
  String userName;
  String name;
  String familyName;
  String profileImageUrl;
  double credit = 0;
  String password;
  List<Book> books = [];

  User(
      {@required this.email,
      @required this.userName,
      @required this.password,
      this.name,
      this.familyName,
      this.profileImageUrl,
      this.credit = 0});
}
