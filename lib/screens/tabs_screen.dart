import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/Book.dart';
import '../models/User.dart';
import 'library_screen.dart';
import 'shop_screen.dart';
import 'user_screen.dart';
import 'home_screen.dart';

class TabsScreen extends StatefulWidget {

  ThemeMode themeMode;
  User user;
  List<Book> bookList;

  TabsScreen(this.themeMode, this.user, this.bookList);


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': HomeScreen(widget.bookList, widget.themeMode, widget.user), 'title': 'Home'},
      {'page': ShopScreen(widget.bookList, widget.themeMode), 'title': 'Shop'},
      {'page': LibraryScreen(widget.bookList), 'title': 'Library'},
      {'page': UserScreen(widget.user), 'title': 'User'}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(20),
      //           bottomRight: Radius.circular(20))),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: SvgPicture.asset(
      //     'assets/images/ketabkhan.svg',
      //     height: 27,
      //   ),
      //   centerTitle: true,
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontFamily: "IranSans"),
          backgroundColor: Colors.blue,
          items: [
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
