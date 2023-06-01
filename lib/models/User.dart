import './Book.dart';

class User {
  String email;
  String userName;
  String password;
  List<Book> books;

  User(this.email, this.userName, this.password);
}