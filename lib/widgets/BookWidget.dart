import 'package:flutter/material.dart';
import 'package:ketabkhan/screens/details_screen.dart';


class BookWidget extends StatelessWidget {
  String imageUrl;
  String name;
  String author;
  int price;

  ThemeMode themeMode;

  BookWidget({this.name, this.author, this.imageUrl, this.price, this.themeMode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imageUrl, fit: BoxFit.cover,))),
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(imageUrl:imageUrl, author: author, price: price, bookName: name, themeMode: themeMode,)));},
    );
  }
}
