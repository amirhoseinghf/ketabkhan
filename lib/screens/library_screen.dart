import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketabkhan/main.dart';
import '../models/user.dart';
import '../widgets/book_widget.dart';
import '../models/book.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = "/library";
  List<Book> bookList = [];
  List<Book> finalList = [];
  User user;

  LibraryScreen(this.bookList, this.user, {Key key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {

  @override
  void initState() {
    widget.finalList = widget.user.books;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List<Book> ebookList = widget.user.books.where((element) => element.type == Type.ebooks).toList();
    List<Book> soundBookList = widget.user.books.where((element) => element.type == Type.soundBooks).toList();

    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton(
            icon: const Icon(Icons.sort),

            onSelected: (result) {
              switch (result) {
                case 'soundBook': setState(() {
                  widget.finalList = soundBookList;
                }); break;
                case 'ebook': setState(() {
                  widget.finalList = ebookList;
                }); break;
              }
            },
            itemBuilder: (ctx) => <PopupMenuEntry<String>> [
              PopupMenuItem(value: 'soundBook',child: Text('فایل صوتی', style: Theme.of(context).textTheme.titleSmall,),),
              PopupMenuItem(value: 'ebook',child: Text('کتاب الکترونیکی', style: Theme.of(context).textTheme.titleSmall,),)
            ],
            initialValue: 'ebook',


          ),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SvgPicture.asset(
            'assets/images/ketabkhan.svg',
            height: 27,
          ),
          centerTitle: true,
          bottom: const TabBar(tabs: [Tab(child: Text("کتاب های شما", style: TextStyle(fontFamily: "IranSans"),),)],),
        ),
        body: widget.user.books.isEmpty ?
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/waiting.png", height: 250, color: Colors.black),
                  Text("!هنوز کتابی نداری", style: Theme.of(context).textTheme.headlineLarge,)
                ],
              ),
            )

            :GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2/3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: widget.finalList.map((ctgItem) => BookWidget(book: ctgItem, user: widget.user,)).toList(),
        ),
      ),
    );
  }
}
