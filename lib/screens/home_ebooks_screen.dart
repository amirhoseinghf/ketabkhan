import 'package:flutter/material.dart';
import '../widgets/BookWidget.dart';
import '../models/Book.dart';

class HomeEbooksScreen extends StatelessWidget {
  List<Book> dummy;

  HomeEbooksScreen(this.dummy);

  @override
  Widget build(BuildContext context) {

    Widget headline(String title) {
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      );
    }

    List<Book> ebooksList = dummy.where((element) => element.type == Type.ebooks).toList();
    List<Book> favoritesList = ebooksList.where((element) => element.category == Category.favorite).toList();
    List<Book> newList = ebooksList.where((element) => element.category == Category.new_release).toList();
    List<Book> topSellingList = ebooksList.where((element) => element.category == Category.top_selling).toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              headline("علاقه‌مندی ها"),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favoritesList.length,
                  itemBuilder: (ctx, index) {return Container(child: BookWidget(name: favoritesList[index].name, author: favoritesList[index].author, imageUrl: favoritesList[index].imageUrl, price: favoritesList[index].price),);},
                ),
              ),
              SizedBox(height: 20,),
              headline("تازه ها"),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newList.length,
                  itemBuilder: (ctx, index) {return Container(child: BookWidget(name: newList[index].name, author: newList[index].author, imageUrl: newList[index].imageUrl,price: newList[index].price,),);},
                ),
              ),
              SizedBox(height: 20,),
              headline("پرفروش ترین ها"),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topSellingList.length,
                  itemBuilder: (ctx, index) {return Container(child: BookWidget(name: topSellingList[index].name, author: topSellingList[index].author, imageUrl: topSellingList[index].imageUrl, price: topSellingList[index].price),);},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}