import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../models/Book.dart';
import '../models/User.dart';
import 'library_screen.dart';
import 'shop_screen.dart';
import 'user_screen.dart';
import 'home_screen.dart';

class TabsScreen extends StatefulWidget {

  static const routeName = "/main";

  User user;
  List<Book> bookList;
  List<Book> myBooks;
  TabsScreen(this.user, this.bookList, this.myBooks, {Key key}) : super(key: key);

  Future<User> getUser() async {
    await Socket.connect("10.0.2.2", 2424).then((socket) {
      socket.write("get_user_info\n \u0000");
      socket.listen((response) {
        var info = jsonDecode(String.fromCharCodes(response));
        user.email = info['email'];
        user.userName = info['userName'];
        user.name = info['name'];
        user.familyName = info['familyName'];
        user.credit = info['credit'];
        user.password = info['password'];
        user.profileImgPath = info['profileImgPath'];
        user.profileImg = Image.file(File(user.profileImgPath));
        List<dynamic> bookIds =info['booksIds'];
        List<Book> appUserBooks = [];
        bookIds.forEach((element) {
          Book b;
          bookList.forEach((someBook) {if(someBook.id == element) appUserBooks.add(someBook);});
        });
        user.books = appUserBooks;
        // print(user.books);
        // print(user.credit);
      });
    });
  }

  List<Book> isReadingBooks = [];
  Future<User> get_reading() async {
    Socket.connect("10.0.2.2", 2424).then((socket) {
      socket.write("get_user_info\n \u0000");
      socket.listen((response) {
        var info = jsonDecode(String.fromCharCodes(response));
        List<dynamic> readingbookIds = info['readingIds'];
        readingbookIds.forEach((element) {
          Book b;
          bookList.forEach((someBook) {
            if (someBook.id == element) {
              if (!user.readingBooks.contains(someBook)) {
                user.readingBooks.add(someBook);
              }
            }
          });
        });
        // print(info["readingIds"]);
      });
    });
  }
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;



  void _selectPage(int index) {
    setState(() {
      widget.getUser();
      widget.get_reading();
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.getUser();

    _pages = [
      {'page': HomeScreen(widget.bookList, widget.user), 'title': 'Home'},
      {'page': ShopScreen(widget.bookList, widget.user), 'title': 'Shop'},
      {'page': LibraryScreen(widget.myBooks, widget.user), 'title': 'Library'},
      {'page': UserScreen(widget.user), 'title': 'User'}
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs;
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontFamily: "IranSans"),
          backgroundColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'خانه'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: "فروشگاه"),
            BottomNavigationBarItem(icon: Icon(Icons.local_library_rounded), label: "کتابخانه"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حساب کاربری')
          ],
        ),
      ),
    );
  }
}
