import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

import '../providers/books_data.dart';
import '../widgets/book_widget.dart';
import '../models/book.dart';

class HomeSoundBooksScreen extends StatelessWidget {
  User user;
  HomeSoundBooksScreen(this.user, {Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<Book> bookList = Provider.of<BooksData>(context).books;

    Widget headline(String title) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            Text(
              title,
              style: const TextStyle(fontFamily: "IranSans", fontSize: 18, color: Colors.white),
            )
          ],
        ),
      );
    }

    List<Book> soundBooks = bookList.where((element) => element.type == Type.soundBooks).toList();
    List<Book> favoritesList = soundBooks.where((element) => element.category == Categoryz.favorite).toList();
    List<Book> newList = soundBooks.where((element) => element.category == Categoryz.newRelease).toList();
    List<Book> topSellingList = soundBooks.where((element) => element.category == Categoryz.topSelling).toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              headline("علاقه‌مندی ها"),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favoritesList.length,
                  itemBuilder: (ctx, index) {return BookWidget(user: user, book: favoritesList[index],);},
                ),
              ),
              const SizedBox(height: 20,),
              headline("تازه ها"),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newList.length,
                  itemBuilder: (ctx, index) {return BookWidget(user: user, book: newList[index],);},
                ),
              ),
              const SizedBox(height: 20,),
              headline("پرفروش ترین ها"),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topSellingList.length,
                  itemBuilder: (ctx, index) {return BookWidget(user: user, book: topSellingList[index],);},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
