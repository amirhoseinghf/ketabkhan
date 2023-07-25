import 'package:flutter/foundation.dart';
import '../models/book.dart';

class BooksData with ChangeNotifier {
   List<Book> _books = [
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

  List<Book> get books {
    return [..._books];
  }




}