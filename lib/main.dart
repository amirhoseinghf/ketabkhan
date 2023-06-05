import 'package:flutter/foundation.dart';
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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();


  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();


}

class _MyAppState extends State<MyApp> {

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

  User emma = new User(email: "emma@gmail.com", userName: "Emmaw11", name: "اما", familyName: "واتسون", password: "PASS", profileImageUrl: "https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png", credit: 0);

  List<Book> dummy_books = [
    Book(
        id: "A1",
        name: "کتابخانه نیمه‌ شب",
        author: "مت هیگ",
        price: 25,
        category: Categoryz.new_release,
        genre: Genre.fiction,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/125302_50943_normal.jpg?width=200"),
    Book(
        id: "A2",
        name: "محکم در آغوشم بگیر",
        author: "سو آنسن",
        price: 39,
        category: Categoryz.top_selling,
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
        category: Categoryz.new_release,
        genre: Genre.horror,
        type: Type.soundBooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136159_76305_normal.jpg?width=200"),
    Book(
        id: "A5",
        name: "حافظه نامحدود",
        author: "کوین هرسلی",
        price: 95,
        category: Categoryz.top_selling,
        genre: Genre.history,
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
      category: Categoryz.top_selling,
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
      category: Categoryz.new_release,
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
      category: Categoryz.top_selling,
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
      category: Categoryz.new_release,
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
        category: Categoryz.new_release,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/125302_50943_normal.jpg?width=200"),
    Book(
        id: "A2",
        name: "محکم در آغوشم بگیر",
        author: "سو آنسن",
        price: 39,
        category: Categoryz.top_selling,
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
        category: Categoryz.new_release,
        type: Type.soundBooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136159_76305_normal.jpg?width=200"),
    Book(
        id: "A5",
        name: "حافظه نامحدود",
        author: "کوین هرسلی",
        price: 95,
        category: Categoryz.top_selling,
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
      category: Categoryz.top_selling,
      type: Type.ebooks,
      imageUrl:
      "https://newcdn.fidibo.com/images/books/99473_44720_normal.jpg?width=200",
    ),];


  @override
  Widget build(BuildContext context) {
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
            titleSmall: TextStyle(color: Color.fromRGBO(11, 94, 160, 1), fontSize: 18),
            titleMedium: TextStyle(color: Colors.white, fontSize: 20,),
            titleLarge: TextStyle(color: Colors.black, fontSize: 20),

          ),
        buttonColor: const Color.fromRGBO(11, 94, 160, 1),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 24),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 16, textBaseline: TextBaseline.alphabetic, fontFamily: "IranSans"),
        bodySmall: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "IranSans"),
        headlineLarge: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "IranSans", fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: Colors.white, fontSize: 23, fontFamily: "IranSans"),
            headlineSmall: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "IranSansNum"),
        titleSmall: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "IranSansNum" ),
        titleMedium: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "IranSans"),
            titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "IranSans")
        ),
        buttonColor: Colors.white,
      ),
      themeMode: _themeMode,



      // initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_themeMode, emma, dummy_books,),
        LoginScreen.routeName: (context) => LoginScreen(_themeMode),
        RegisterScreen.routeName: (context) => RegisterScreen(_themeMode),
        HomeScreen.routeName: (context) => HomeScreen(dummy_books, _themeMode, emma),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        LibraryScreen.routeName: (context) => LibraryScreen(dummy_books),
        ShopScreen.routeName: (context) => ShopScreen(dummy_books, _themeMode),
        UserScreen.routeName: (context) => UserScreen(emma),
        PaymentScreen.routeName: (context) => PaymentScreen(emma),
      },

    );
  }
}