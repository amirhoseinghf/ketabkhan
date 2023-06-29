import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/shop_screen.dart';
import './screens/user_screen.dart';
import './models/Book.dart';
import './models/User.dart';
import './screens/details_screen.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';
import './screens/library_screen.dart';
import './screens/payment_screen.dart';
import './screens/profileedit_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => MyAppState();


  static MyAppState of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();

  List<Book> isReadingBooks = [];

}

class MyAppState extends State<MyApp> {

  Brightness brigh = Brightness.light;
  ThemeMode _themeMode = ThemeMode.light;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
      if(themeMode == ThemeMode.dark) {
        brigh = Brightness.dark;
      } else if (themeMode == ThemeMode.light) {
        brigh = Brightness.light;
      }
    });
  }

  ThemeMode getTheme() {
    return _themeMode;
  }



  User appUser = User(email: "admin", userName: "admin", password: "admin");



  Future<User> getUser() async {
    await Socket.connect("10.0.2.2", 2424).then((socket) {
      socket.write("get_user_info\n \u0000");
      socket.listen((response) {
        var info = jsonDecode(String.fromCharCodes(response));
        appUser.email = info['email'];
        appUser.userName = info['userName'];
        appUser.name = info['name'];
        appUser.familyName = info['familyName'];
        appUser.credit = info['credit'];
        appUser.password = info['password'];
        List<dynamic> bookIds =info['booksIds'];
        List<Book> appUserBooks = [];
        bookIds.forEach((element) {
          Book b;
          dummy_books.forEach((someBook) {if(someBook.id == element) {

            appUserBooks.add(someBook);

          }});
        });
        appUser.books = appUserBooks;
      });
    });
  }

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
              if (!appUser.readingBooks.contains(someBook)){
                setState(() {
                  appUser.readingBooks.add(someBook);
                });
              }
            }
          });
        });
        print(info["readingIds"]);
      });
    });
  }

  // User emma = User(email: "emma@gmail.com", userName: "Emmaw11", name: "اما", familyName: "واتسون", password: "PASS", profileImageUrl: "https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png", credit: 0);

  List<Book> dummy_books = [
    Book(
        id: "A1",
        name: "کتابخانه نیمه‌ شب",
        author: "مت هیگ",
        price: 25,
        category: Categoryz.newRelease,
        genre: Genre.fiction,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/125302_50943_normal.jpg?width=200"),
    Book(
        id: "A2",
        name: "محکم در آغوشم بگیر",
        author: "سو آنسن",
        price: 39,
        category: Categoryz.topSelling,
        genre: Genre.romance,
        type: Type.soundBooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136671_72256_normal.jpg?width=200"),
    Book(
        id: "A3",
        name: "خرده‌ عادت‌ ها",
        author: "جیمز کلیر",
        price: 45,
        category: Categoryz.favorite,
        genre: Genre.fiction,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136068_15784_normal.jpg?width=200"),
    Book(
        id: "A4",
        name: "بی‌ حد و مرز",
        author: "جیمز کوییک",
        price: 79,
        category: Categoryz.newRelease,
        genre: Genre.horror,
        type: Type.soundBooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136159_76305_normal.jpg?width=200"),
    Book(
        id: "A5",
        name: "حافظه نامحدود",
        author: "کوین هرسلی",
        price: 95,
        category: Categoryz.topSelling,
        genre: Genre.history,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/86186_36247_normal.jpg?width=200",
    ),
    Book(
      id: "A6",
      name: "بخشنده",
      author: "لوئیس لوری",
      price: 37,
      category: Categoryz.favorite,
      genre: Genre.fiction,
      type: Type.soundBooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/78598_85402_normal.jpg?width=200",
    ),
    Book(
      id: "A7",
      name: "1984",
      author: "جورج اورول",
      price: 24,
      category: Categoryz.topSelling,
      genre: Genre.horror,
      type: Type.ebooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/99473_44720_normal.jpg?width=200",
    ),
    Book(
      id: "A8",
      name: "مدیریت خود",
      author: "پیتر دراکر",
      price: 24,
      category: Categoryz.newRelease,
      genre: Genre.romance,
      type: Type.ebooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/85481_79104_normal.jpg?width=200",
    ),
    Book(
      id: "A9",
      name: "ملت عشق",
      author: "الیف شافاک",
      price: 25,
      category: Categoryz.topSelling,
      genre: Genre.history,
      type: Type.ebooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/4339_22364_normal.jpg?width=200",
    ),
    Book(
      id: "A10",
      name: "من پیش از تو",
      author: "جوجو مویز",
      price: 29,
      category: Categoryz.favorite,
      genre: Genre.fiction,
      type: Type.ebooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/65672_11136_normal.jpg?width=200",
    ),
    Book(
      id: "A11",
      name: "وقتی نیچه گریست",
      author: "اروین یالوم",
      price: 34,
      category: Categoryz.favorite,
      genre: Genre.horror,
      type: Type.ebooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/62882_79534_normal.jpg?width=200",
    ),
    Book(
      id: "A12",
      name: " زنی در کابین ۱۰",
      author: "روث ور",
      price: 34,
      category: Categoryz.newRelease,
      genre: Genre.romance,
      type: Type.ebooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/71164_29991_normal.jpg?width=200",
    ),
  ];

  List<Book> tempList = [
    Book(
        id: "A1",
        name: "کتابخانه نیمه‌ شب",
        author: "مت هیگ",
        price: 25,
        category: Categoryz.newRelease,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/125302_50943_normal.jpg?width=200"),
    Book(
        id: "A2",
        name: "محکم در آغوشم بگیر",
        author: "سو آنسن",
        price: 39,
        category: Categoryz.topSelling,
        type: Type.soundBooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136671_72256_normal.jpg?width=200"),
    Book(
        id: "A3",
        name: "خرده‌ عادت‌ ها",
        author: "جیمز کلیر",
        price: 45,
        category: Categoryz.favorite,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136068_15784_normal.jpg?width=200"),
    Book(
        id: "A4",
        name: "بی‌ حد و مرز",
        author: "جیمز کوییک",
        price: 79,
        category: Categoryz.newRelease,
        type: Type.soundBooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136159_76305_normal.jpg?width=200"),
    Book(
        id: "A5",
        name: "حافظه نامحدود",
        author: "کوین هرسلی",
        price: 95,
        category: Categoryz.topSelling,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/86186_36247_normal.jpg?width=200",
        isReadingNow: true),
    Book(
      id: "A6",
      name: "بخشنده",
      author: "لوئیس لوری",
      price: 37,
      category: Categoryz.favorite,
      type: Type.soundBooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/78598_85402_normal.jpg?width=200",
    ),
    Book(
      id: "A7",
      name: "1984",
      author: "جورج اورول",
      price: 24,
      category: Categoryz.topSelling,
      type: Type.ebooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/99473_44720_normal.jpg?width=200",
    ),];


  @override
  Widget build(BuildContext context) {
    get_reading();
    setState(() {
      get_reading();
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ketabkhan",
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(11, 94, 160, 1),
          accentColor: const Color.fromRGBO(63, 220, 255, 1),
          canvasColor: const Color.fromRGBO(221, 240, 255, 1),
          fontFamily: "IranSansNum",
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(color: Theme.of(context).primaryColor),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 20, color: Colors.white,),
            bodyMedium: TextStyle(color: Color.fromRGBO(11, 94, 160, 1), fontSize: 16, textBaseline: TextBaseline.alphabetic),
            bodySmall: TextStyle(color: Colors.black, fontSize: 16),
              headlineLarge: TextStyle(color: Colors.black, fontSize: 24, fontFamily: "IranSans", fontWeight: FontWeight.bold),
              headlineSmall: TextStyle(color: Colors.black, fontSize: 20),
              headlineMedium: TextStyle(color: Colors.black, fontSize: 23, fontFamily: "IranSans",),
            titleSmall: TextStyle(color: Colors.black, fontSize: 18),
            titleMedium: TextStyle(color: Colors.white, fontSize: 20,),
            titleLarge: TextStyle(color: Colors.black, fontSize: 20),

          ),
        buttonColor: const Color.fromRGBO(11, 94, 160, 1),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 24, color: Colors.white, fontFamily: "IranSansNum"),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 16, textBaseline: TextBaseline.alphabetic, fontFamily: "IranSans"),
        bodySmall: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "IranSans"),
        headlineLarge: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "IranSans", fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: Colors.white, fontSize: 23, fontFamily: "IranSans"),
            headlineSmall: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "IranSansNum"),
        titleSmall: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "IranSansNum" ),
        titleMedium: TextStyle(color: Colors.black, fontSize: 19, fontFamily: "IranSans"),
            titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "IranSans")
        ),
        buttonColor: Colors.white,
      ),
      themeMode: _themeMode,



      initialRoute: LoginScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(appUser, dummy_books, appUser.books),
        LoginScreen.routeName: (context) => LoginScreen(_themeMode),
        RegisterScreen.routeName: (context) => RegisterScreen(_themeMode),
        HomeScreen.routeName: (context) => HomeScreen(appUser.books, appUser),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        LibraryScreen.routeName: (context) => LibraryScreen(appUser.books, appUser),
        ShopScreen.routeName: (context) => ShopScreen(dummy_books, appUser),
        UserScreen.routeName: (context) => UserScreen(appUser),
        PaymentScreen.routeName: (context) => PaymentScreen(appUser),
        ProfileEditScreen.routeName: (context) => ProfileEditScreen(appUser),
      },

    );
  }
}