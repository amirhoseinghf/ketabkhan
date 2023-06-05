import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/User.dart';
import '../widgets/LinProg.dart';
import '../widgets/BookWidget.dart';
class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';

  final String imageUrl;
  String bookName;
  String author;
  int price;
  ThemeMode themeMode;
  User user;

  DetailsScreen(
      {@required this.imageUrl, this.bookName, this.author, this.price, this.themeMode, this.user});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  double currentRating = 1;
  double total = 0;
  double count = 0;

  int countOf5s = 0;
  int countOf4s = 0;
  int countOf3s = 0;
  int countOf2s = 0;
  int countOf1s = 0;

  int dm = 0;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    var deviceSize = MediaQuery.of(context).size;

    bool isLightMode = widget.themeMode == ThemeMode.light || (widget.themeMode == ThemeMode.system && ThemeMode.system == ThemeMode.light);


    double addAndReturnSum(double rating) {
      setState(() {
        count++;
        total += rating;
        var sum = total / count;
        currentRating = sum;

        if(rating > 0 && rating <= 1.5) countOf1s++;
        if(rating > 1.5 && rating <= 2.5) countOf2s++;
        if(rating > 2.5 && rating <= 3.5) countOf3s++;
        if(rating > 3.5 && rating <= 4.5) countOf4s++;
        if(rating > 4.5 && rating <= 5) countOf5s++;

        return sum;
      });
    }

    double percent(int num) {

      switch(num) {
        case 5: dm = countOf5s; break;
        case 4: dm = countOf4s; break;
        case 3: dm = countOf3s; break;
        case 2: dm = countOf2s; break;
        case 1: dm = countOf1s; break;
      }
      if(count == 0) {
        return 0;
      } else {
        return dm / count;
      }

    }

    Widget BookInformation() {
      return Column(
        children: [
          Container(
              height: 250,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 20,
                  blurStyle: BlurStyle.normal,
                )
              ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.bookName,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Text(widget.author, style: Theme.of(context).textTheme.titleSmall,)
        ],
      );
    }

    Widget BookmarkAndFavorite() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.bookmark),
          Column(
            children: [
              RatingBar(
                minRating: 1,
                maxRating: 5,
                initialRating: currentRating,
                itemSize: 20,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  half: const Icon(
                    Icons.star_half_rounded,
                    color: Colors.amber,
                  ),
                  empty: const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ),
                ignoreGestures: true,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "از ${count.toStringAsFixed(0)} رای",
                style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: "IranSans"),
              ),
            ],
          ),
          Icon(Icons.favorite_border),
        ],
      );
    }

    Widget BuyAndReadButtons() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(20),
              ),
              child: Text(
                " خرید | ${widget.price} هزار تومان",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: deviceSize.width * 0.4,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "نمونه",
                      style: Theme.of(context).textTheme.bodyMedium
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0,
                            color: Theme.of(context).buttonColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: deviceSize.width * 0.45,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "خرید اشتراک ویژه",
                      style: TextStyle(fontSize: 16, color: Colors.amber),
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Colors.amber),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ))
            ],
          ),
        ],
      );
    }

    Widget BookDescription() {
      return Directionality(
          textDirection: TextDirection.rtl,
          child: RichText(
              text: TextSpan(
                  text:
                  "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد. ادامه توضیحات..",
                  style: Theme.of(context).textTheme.bodySmall)));
    }

    Widget BookDetails() {
      return Container(
          width: double.infinity,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    "نام نویسنده",
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontFamily: "IranSans"),
                  ),
                  trailing: Text(
                    widget.author,
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text(
                    "قیمت",
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontFamily: "IranSans"),
                  ),
                  trailing: Text(
                    "${widget.price} هزار تومان",
                    style: TextStyle(color: Theme.of(context).accentColor, fontFamily: "IranSansNum"),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text(
                    "ژانر",
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontFamily: "IranSans"),
                  ),
                  trailing: Text(
                    "فانتزی",
                    style: TextStyle(color: Theme.of(context).accentColor, fontFamily: "IranSans"),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text(
                    "دسته بندی",
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontFamily: "IranSans"),
                  ),
                  trailing: Text(
                    "کتاب های الکترونیک",
                    style: TextStyle(color: Theme.of(context).accentColor, fontFamily: "IranSans"),
                  ),
                ),
              ],
            ),
          ));
    }

    Widget ReviewAndComment() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("به این کتاب امتیاز دهید", style: TextStyle(fontFamily: "IranSans", fontWeight: FontWeight.bold, fontSize: 15),),
                  Text("نظر خود را با دیگران به اشتراک بگذارید", style: TextStyle(fontFamily: "IranSans", fontSize: 10)),
                ],),
            ],
          ),
          SizedBox(height: 15,),
          Center(child:  RatingBar(
            initialRating: 0,
            updateOnDrag: false,
            tapOnlyMode: false,
            onRatingUpdate: addAndReturnSum,
            minRating: 1,
            maxRating: 5,
            // allowHalf: true,
            ratingWidget: RatingWidget(
                full: Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                empty: Icon(Icons.star, color: Colors.white),
                half: Icon(Icons.star_half_rounded, color: Colors.amber)),
          ),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                Text(currentRating.toStringAsFixed(1), style: TextStyle(fontFamily: "IranSansNum", fontWeight: FontWeight.bold, fontSize: 40,),),
                RatingBar(
                  initialRating: currentRating,
                  minRating: 0,
                  maxRating: 5,
                  allowHalfRating: true,
                  itemSize: 20,
                  ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      empty: Icon(Icons.star, color: Colors.white),
                      half: Icon(Icons.star_half_rounded, color: Colors.amber)),
                  ignoreGestures: true,
                ),
                SizedBox(height: 5,),
                Text("${count} تعداد نظرات ", style: TextStyle(fontFamily: "IranSansNum", fontSize: 15,),),
              ],),
              Container(
                  width: 200,
                  height: 140,
                  child: Center(
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          int n = 5;
                          return LinProg(n - i, percent(n - i));
                        }),
                  )
              )
            ],)

        ],),
      );
    }

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_forward_ios_rounded))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        leading: Icon(Icons.share_rounded),
        title: SvgPicture.asset(
          'assets/images/ketabkhan.svg',
          height: 27,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              BookInformation(),
              SizedBox(
                height: 15,
              ),
              BookmarkAndFavorite(),
              SizedBox(
                height: 15,
              ),
              BuyAndReadButtons(),
              SizedBox(
                height: 15,
              ),
              BookDescription(),
              SizedBox(
                height: 15,
              ),
              BookDetails(),
              SizedBox(
                height: 15,
              ),
              ReviewAndComment()
            ],
          ),
        ),
      ),
    );
  }
}
