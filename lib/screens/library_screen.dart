import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/BookWidget.dart';
import '../models/Book.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = "/library";
  List<Book> bookList = [];

  LibraryScreen(this.bookList);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {

  List<Book> finalList = [];
  
  @override
  Widget build(BuildContext context) {
    

    List<Book> ebookList = widget.bookList.where((element) => element.type == Type.ebooks).toList();
    List<Book> soundBookList = widget.bookList.where((element) => element.type == Type.soundBooks).toList();

    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton(
            icon: Icon(Icons.sort),
            onSelected: (result) {
              switch (result) {
                case 'soundBook': setState(() {
                  finalList = soundBookList;
                });; break;
                case 'ebook': setState(() {
                  finalList = ebookList;
                });; break;
              }
            },
            itemBuilder: (ctx) => <PopupMenuEntry<String>> [
              PopupMenuItem(child: Text('فایل صوتی'), value: 'soundBook',),
              PopupMenuItem(child: Text('کتاب الکترونیکی'), value: 'ebook',)
            ],
            initialValue: 'ebook',

          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_forward_ios_rounded))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SvgPicture.asset(
            'assets/images/ketabkhan.svg',
            height: 27,
          ),
          centerTitle: true,
          bottom: TabBar(tabs: [Tab(child: Text("کتاب های شما"),)],),
        ),
        body: GridView(
          padding: const EdgeInsets.all(20),
          children: finalList.map((ctgItem) => BookWidget(name: ctgItem.name, author: ctgItem.author,imageUrl: ctgItem.imageUrl,price: ctgItem.price,)).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2/3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
