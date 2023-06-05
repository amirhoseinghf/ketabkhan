import 'package:flutter/material.dart';
import 'package:ketabkhan/screens/details_screen.dart';

import '../models/Book.dart';
import '../models/User.dart';


class BookWidget extends StatefulWidget {


  User user;
  Book book;


  BookWidget({this.user, this.book});

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.book.imageUrl, fit: BoxFit.cover,))),
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(book: widget.book, user: widget.user,))).then((value) {setState(() {

      });});},
    );
  }
}
