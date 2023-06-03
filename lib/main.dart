import 'package:flutter/material.dart';
import './screens/shop_screen.dart';
import './screens/user_screen.dart';
import './models/Book.dart';
import './models/User.dart';
import './screens/details_screen.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';
import './screens/library_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();


}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  User emma = new User(email: "emma@gmail.com", userName: "Emmaw11", name: "اما", familyName: "واتسون", password: "PASS", profileImageUrl: "https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png", credit: 0);

  List<Book> dummy_books = [
    Book(
        id: "A1",
        name: "کتابخانه نیمه‌ شب",
        author: "مت هیگ",
        price: 25,
        category: Category.new_release,
        genre: Genre.fiction,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/125302_50943_normal.jpg?width=200"),
    Book(
        id: "A2",
        name: "محکم در آغوشم بگیر",
        author: "سو آنسن",
        price: 39,
        category: Category.top_selling,
        genre: Genre.romance,
        type: Type.soundBooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136671_72256_normal.jpg?width=200"),
    Book(
        id: "A3",
        name: "خرده‌ عادت‌ ها",
        author: "جیمز کلیر",
        price: 45,
        category: Category.favorite,
        genre: Genre.fiction,
        type: Type.ebooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136068_15784_normal.jpg?width=200"),
    Book(
        id: "A4",
        name: "بی‌ حد و مرز",
        author: "جیمز کوییک",
        price: 79,
        category: Category.new_release,
        genre: Genre.horror,
        type: Type.soundBooks,
        imageUrl:
        "https://newcdn.fidibo.com/images/books/136159_76305_normal.jpg?width=200"),
    Book(
        id: "A5",
        name: "حافظه نامحدود",
        author: "کوین هرسلی",
        price: 95,
        category: Category.top_selling,
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
      category: Category.favorite,
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
      category: Category.top_selling,
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
      category: Category.new_release,
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
      category: Category.top_selling,
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
      category: Category.favorite,
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
      category: Category.favorite,
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
      category: Category.new_release,
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
        fontFamily: "IranSans",
        appBarTheme: AppBarTheme(color: Theme.of(context).primaryColor),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 16, textBaseline: TextBaseline.alphabetic),
            bodySmall: TextStyle(color: Colors.white, fontSize: 12),
          headlineSmall: TextStyle(color: Colors.black, fontSize: 24),
        titleSmall: TextStyle(color: Color.fromRGBO(11, 94, 160, 1), fontSize: 16),
          titleMedium: TextStyle(color: Color.fromRGBO(11, 94, 160, 1), fontSize: 20),

        ),
        buttonTheme: const ButtonThemeData(buttonColor: Color.fromRGBO(11, 94, 160, 1),)
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,



      initialRoute: UserScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(dummy_books),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        LibraryScreen.routeName: (context) => LibraryScreen(tempList),
        ShopScreen.routeName: (context) => ShopScreen(dummy_books),
        UserScreen.routeName: (context) => UserScreen(emma),
      },
    );
  }
}
