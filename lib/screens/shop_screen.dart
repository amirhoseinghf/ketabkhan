import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/book.dart';
import '../models/user.dart';

import '../widgets/book_widget.dart';
import 'details_screen.dart';

class ShopScreen extends StatefulWidget {
  static const routeName = '/shop';

  final List<Book> bookList;
  User user;

  ShopScreen(this.bookList, this.user, {Key key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Book> filteredBooks = [];
  bool isLoading = false;
  final FocusNode _focusNode = FocusNode();
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: _showContainer
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))
                      : BorderRadius.circular(15)),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    SizedBox(
                        height: 30,
                        width: deviceSize.width * 0.6,
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            hintText: "جستجو",
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 15),
                            border: InputBorder.none,
                          ),
                          // focusNode: _focusNode,
                          onTap: () {
                            setState(() {
                              _showContainer = true;
                            });
                          },
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
                        borderRadius: const BorderRadius.only(
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
                                      leading: SizedBox(
                                          height: 40,
                                          child: Image.network(
                                            filteredBooks[index].imageUrl,
                                            fit: BoxFit.cover,
                                          )),
                                      title: Text(
                                        filteredBooks[index].name,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _showContainer = true;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsScreen(
                                                      book: filteredBooks[index], user: widget.user,
                                                    )));
                                      },
                                    ),
                                    const Divider(
                                      color: Colors.white24,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    }

    Widget genresCards() {
      Widget genreCard(String title, String imageUrl) {
        return Container(
            height: 10,
            width: 70,
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover)),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 200,
                        height: 35,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                // topLeft: Radius.circular(15),
                                // bottomLeft: Radius.circular(15)
                            ),
                            color: Colors.black38),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8),
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                )));
      }

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
        height: 300,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          padding: EdgeInsets.zero,
          children: [
            genreCard("تخیلی", 'assets/images/genres/fiction.jpg'),
            genreCard("عاشقانه", 'assets/images/genres/romance.jpg'),
            genreCard("تاریخی", 'assets/images/genres/history.jpg'),
            genreCard("ترسناک", 'assets/images/genres/horror.jpg')
          ],
        ),
      );
    }

    Widget section(String title, IconData icon) {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:  [
                      Icon(
                        icon,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                  const Icon(Icons.arrow_forward, size: 26,),
                ],
              )),
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ListView.builder(
            itemCount: widget.bookList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) {
              widget.bookList.shuffle();
              return BookWidget(
              user: widget.user,
              book: widget.bookList[i],);},

          ),
        ),
      ],);
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _showContainer = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              searchBar(),
              const SizedBox(
                height: 10,
              ),
              genresCards(),
              SizedBox(
                width: deviceSize.width * 0.8,
                height: 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://newcdn.fidibo.com/img/Slides/shakoori-sale.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
             section("کتاب های پرطرفدار", Icons.trending_up_rounded),
              section("پرفروش های این هفته", Icons.attach_money_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
