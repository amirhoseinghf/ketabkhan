import 'package:flutter/material.dart';
import 'package:ketabkhan/screens/home_soundbooks_screen.dart';
import 'package:ketabkhan/widgets/BookWidget.dart';
import 'package:ketabkhan/widgets/CurrentReadingBookWidget.dart';
import './home_ebooks_screen.dart';
import '../models/Book.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Book> dummy_books = [
    Book(
        id: "A1",
        name: "کتابخانه نیمه‌ شب",
        author: "مت هیگ",
        price: 25,
        category: Category.new_release,
        type: Type.ebooks,
        imageUrl:
            "https://newcdn.fidibo.com/images/books/125302_50943_normal.jpg?width=200"),
    Book(
        id: "A2",
        name: "محکم در آغوشم بگیر",
        author: "سو آنسن",
        price: 39,
        category: Category.top_selling,
        type: Type.soundBooks,
        imageUrl:
            "https://newcdn.fidibo.com/images/books/136671_72256_normal.jpg?width=200"),
    Book(
        id: "A3",
        name: "خرده‌ عادت‌ ها",
        author: "جیمز کلیر",
        price: 45,
        category: Category.favorite,
        type: Type.ebooks,
        imageUrl:
            "https://newcdn.fidibo.com/images/books/136068_15784_normal.jpg?width=200"),
    Book(
        id: "A4",
        name: "بی‌ حد و مرز",
        author: "جیمز کوییک",
        price: 79,
        category: Category.new_release,
        type: Type.soundBooks,
        imageUrl:
            "https://newcdn.fidibo.com/images/books/136159_76305_normal.jpg?width=200"),
    Book(
        id: "A5",
        name: "حافظه نامحدود",
        author: "کوین هرسلی",
        price: 95,
        category: Category.top_selling,
        type: Type.ebooks,
        imageUrl:
            "https://newcdn.fidibo.com/images/books/86186_36247_normal.jpg?width=200",
        isReadingNow: true),
    Book(
      id: "A6",
      name: "بخشنده",
      author: "لوئیس لوری",
      price: 37,
      category: Category.favorite,
      type: Type.soundBooks,
      imageUrl:
          "https://newcdn.fidibo.com/images/books/78598_85402_normal.jpg?width=200",
    ),
    Book(
      id: "A7",
      name: "1984",
      author: "جورج اورول",
      price: 24,
      category: Category.top_selling,
      type: Type.ebooks,
      imageUrl:
          "https://newcdn.fidibo.com/images/books/99473_44720_normal.jpg?width=200",
    ),
    Book(
      id: "A8",
      name: "مدیریت خود",
      author: "پیتر دراکر",
      price: 24,
      category: Category.new_release,
      type: Type.ebooks,
      imageUrl:
          "https://newcdn.fidibo.com/images/books/85481_79104_normal.jpg?width=200",
    ),
    Book(
      id: "A9",
      name: "ملت عشق",
      author: "الیف شافاک",
      price: 25,
      category: Category.top_selling,
      type: Type.ebooks,
      imageUrl:
          "https://newcdn.fidibo.com/images/books/4339_22364_normal.jpg?width=200",
    ),
    Book(
      id: "A10",
      name: "من پیش از تو",
      author: "جوجو مویز",
      price: 29,
      category: Category.favorite,
      type: Type.ebooks,
      imageUrl:
          "https://newcdn.fidibo.com/images/books/65672_11136_normal.jpg?width=200",
    ),
    Book(
      id: "A11",
      name: "وقتی نیچه گریست",
      author: "اروین یالوم",
      price: 34,
      category: Category.favorite,
      type: Type.ebooks,
      imageUrl:
          "https://newcdn.fidibo.com/images/books/62882_79534_normal.jpg?width=200",
    ),
    Book(
      id: "A12",
      name: " زنی در کابین ۱۰",
      author: "روث ور",
      price: 34,
      category: Category.new_release,
      type: Type.ebooks,
      imageUrl:
          "https://newcdn.fidibo.com/images/books/71164_29991_normal.jpg?width=200",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    List<Book> isReadingBooks =
        dummy_books.where((element) => element.isReadingNow == true).toList();


    return DefaultTabController(

      length: 2,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: deviceSize.height * 0.43,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: isReadingBooks.length == 0
                    ? Text(
                        '!هنوز کتاب درحال خوندنی نداری',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )
                    : Center(
                      child:
                            Container(
                              height: deviceSize.height * 0.43,
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
              height: 50,
              child: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text("کتاب های الکترونیک"),
                    ),
                    Tab(
                      child: Text("کتاب های صوتی"),
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
                    child: HomeEbooksScreen(dummy_books),
                  ),
                  Container(
                    color: Theme.of(context).canvasColor,
                    child: HomeSoundBooksScreen(dummy_books),
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
