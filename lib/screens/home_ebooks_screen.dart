
import 'package:flutter/material.dart';
import '../models/User.dart';
import '../widgets/BookWidget.dart';
import '../models/Book.dart';

class HomeEbooksScreen extends StatelessWidget {
  List<Book> dummy;
  User user;
  HomeEbooksScreen(this.dummy, this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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

    List<Book> ebooksList = dummy.where((element) => element.type == Type.ebooks).toList();
    List<Book> favoritesList = ebooksList.where((element) => element.category == Categoryz.favorite).toList();
    List<Book> newList = ebooksList.where((element) => element.category == Categoryz.newRelease).toList();
    List<Book> topSellingList = ebooksList.where((element) => element.category == Categoryz.topSelling).toList();
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
                  itemBuilder: (ctx, index) {return BookWidget(user: user,book: newList[index],);},
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
