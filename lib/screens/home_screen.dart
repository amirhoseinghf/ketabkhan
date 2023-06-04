import 'package:flutter/material.dart';
import 'package:ketabkhan/screens/home_soundbooks_screen.dart';
import 'package:ketabkhan/widgets/BookWidget.dart';
import 'package:ketabkhan/widgets/CurrentReadingBookWidget.dart';
import './home_ebooks_screen.dart';
import '../models/Book.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  List<Book> dummy_books;
  ThemeMode themeMode;

  HomeScreen(this.dummy_books, this.themeMode);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    List<Book> isReadingBooks =
        widget.dummy_books.where((element) => element.isReadingNow == true).toList();


    return DefaultTabController(

      length: 2,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: deviceSize.height * 0.4,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: isReadingBooks.length == 0
                    ? Text(
                        '!هنوز کتاب درحال خوندنی نداری',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    : Center(
                      child:
                            Container(
                              height: deviceSize.height * 0.4,
                              margin: EdgeInsets.only(top: 12),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                  itemCount: isReadingBooks.length,
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, i) {
                                    return CurrentReadingBookWidget(isReadingBooks[i].name, isReadingBooks[i].imageUrl);
                                  }),
                            ),
                        ),
                    ),
              ),
            Container(
              height: 80,
              child: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                bottom: TabBar(
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
                    child: HomeEbooksScreen(widget.dummy_books, widget.themeMode),
                  ),
                  Container(
                    color: Theme.of(context).canvasColor,
                    child: HomeSoundBooksScreen(widget.dummy_books, widget.themeMode),
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
