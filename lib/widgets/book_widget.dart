import 'package:flutter/material.dart';
import 'package:ketabkhan/screens/details_screen.dart';

import '../models/book.dart';
import '../models/user.dart';


class BookWidget extends StatefulWidget {


  User user;
  Book book;


  BookWidget({Key key, this.user, this.book}) : super(key: key);

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.book.imageUrl, fit: BoxFit.cover,))),
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(book: widget.book, user: widget.user,))).then((value) {setState(() {

      });});},
    );
  }
}
