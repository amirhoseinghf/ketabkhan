import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/Book.dart';
import 'details_screen.dart';

class ShopScreen extends StatefulWidget {
  static const routeName = '/shop';

  final List<Book> bookList;

  ShopScreen(this.bookList);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Book> filteredBooks = [];
  bool isLoading = false;
  FocusNode _focusNode = FocusNode();
  bool _showContainer = false;


  @override
  void initState() {
    super.initState();
    filteredBooks = widget.bookList;
    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      filteredBooks = widget.bookList
          .where((element) => element.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    Widget searchBar() {
      return Center(
        child: Column(
          children: [
            Container(
              width: deviceSize.width * 0.9,
              height: 45,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: _showContainer
                      ? BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))
                      : BorderRadius.circular(15)),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Container(
                        height: 30,
                        width: deviceSize.width * 0.6,
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            hintText: "جستجو",
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 15),
                            border: InputBorder.none,
                          ),
                          // focusNode: _focusNode,
                          onTap: () {setState(() {
                            _showContainer = true;
                          });},
                        ))
                  ],
                ),
              ),
            ),
            _showContainer
                ? Container(
                    height: 300,
                    width: deviceSize.width * 0.9,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: isLoading
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : ListView.builder(
                            itemCount: filteredBooks.length,
                            itemBuilder: (ctx, index) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                          height: 40,
                                          child: Image.network(filteredBooks[index].imageUrl, fit: BoxFit.cover,)),
                                      title: Text(
                                        filteredBooks[index].name,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _showContainer = true;
                                        });
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(imageUrl:filteredBooks[index].imageUrl, author: filteredBooks[index].author, price: filteredBooks[index].price, bookName: filteredBooks[index].name,)));},
                                    ),
                                    Divider(color: Colors.white24,),
                                  ],
                                ),
                              );
                            },
                          ),
                  )
                : SizedBox(),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: (){setState(() {
        _showContainer = false;
      });},
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SvgPicture.asset(
            'assets/images/ketabkhan.svg',
            height: 27,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            searchBar(),
          ],
        ),
      ),
    );
  }
}
