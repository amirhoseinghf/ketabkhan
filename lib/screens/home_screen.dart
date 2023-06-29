import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ketabkhan/screens/home_soundbooks_screen.dart';
import 'package:ketabkhan/widgets/CurrentReadingBookWidget.dart';
import '../models/User.dart';
import './home_ebooks_screen.dart';
import '../models/Book.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  List<Book> dummy_books;
  User user;

  HomeScreen(this.dummy_books, this.user, {Key key}) : super(key: key);

  Future<User> get_reading() async {
    Socket.connect("10.0.2.2", 2424).then((socket) {
      socket.write("get_user_info\n \u0000");
      socket.listen((response) {
        var info = jsonDecode(String.fromCharCodes(response));
        List<dynamic> readingbookIds =info['readingIds'];
        readingbookIds.forEach((element) {
          Book b;
          dummy_books.forEach((someBook) {
            if(someBook.id == element){
              if (!user.readingBooks.contains(someBook)){user.readingBooks.add(someBook);}
            }
          });
        });
        // print(info["readingIds"]);
      });
    });
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  List<Book> isReadingBooks = [];
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    widget.get_reading();
    setState(() {
      widget.get_reading();
    });


    return DefaultTabController(

      length: 2,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: deviceSize.height * 0.42,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: widget.user.readingBooks.isEmpty
                    ? Column(
                      children: [
                        const SizedBox(height: 160,),
                        Text(
                            ' !هنوز کتاب درحال خوندنی نداری',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        const SizedBox(height: 20,),
                        const Text("🥲", style: TextStyle(fontSize: 35),)
                      ],
                    )
                    : Column(
                      children: [
                        const SizedBox(height: 46,),
                        const Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text("کتاب های در حال خواندن:", style: TextStyle(color: Colors.white),)),

                        Center(
                          child:
                                SizedBox(
                                  height: deviceSize.height * 0.33,
                                  // margin: EdgeInsets.only(top: 12),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                      itemCount: widget.user.readingBooks.length,
                                      shrinkWrap: true,
                                      itemBuilder: (ctx, i) {
                                        return CurrentReadingBookWidget(widget.user.readingBooks[i].name, widget.user.readingBooks[i].imageUrl);
                                      }),
                                ),
                            ),
                      ],
                    ),
                    ),
              ),
            SizedBox(
              height: 80,
              child: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      child: Text("کتاب های الکترونیک", style: TextStyle(color: Colors.white, fontFamily: "IranSans"),),
                    ),
                    Tab(
                      child: Text("کتاب های صوتی", style: TextStyle(fontFamily: "IranSans"),),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Theme.of(context).canvasColor,
                    child: HomeEbooksScreen(widget.dummy_books, widget.user),
                  ),
                  Container(
                    color: Theme.of(context).canvasColor,
                    child: HomeSoundBooksScreen(widget.dummy_books, widget.user),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
