import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketabkhan/main.dart';
import 'package:ketabkhan/screens/payment_screen.dart';

import '../models/User.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user';

  final User user;

  const UserScreen(this.user, {Key key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    MyApp.of(context).getUser();
    var deviceSize = MediaQuery.of(context).size;
    ThemeMode current = MyApp.of(context).getTheme() == ThemeMode.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    Widget userDetails() {
      return Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Container(
              height: 140,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(500)),
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: widget.user.profileImageUrl != null
                      ? Image.network(
                          widget.user.profileImageUrl,
                          fit: BoxFit.fill,
// color: Colors.white,
                          height: 5,
                          errorBuilder: (context, child, loadingProgress) =>
                              Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png",
                            color: Colors.white,
                          ),
                        )
                      : Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png",
                          color: Colors.white,
                        ))),
          const SizedBox(
            height: 10,
          ),
          Text(
            (widget.user.name != null && widget.user.name != "admin")
                ? "${widget.user.name} ${widget.user.familyName}"
                : widget.user.userName,
            style: TextStyle(
                color: current == ThemeMode.light ||
                        (current == ThemeMode.system &&
                            ThemeMode.system == ThemeMode.light)
                    ? Colors.black
                    : Colors.white,
                fontSize: 16,
                fontFamily: "IranSans"),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "اعتبار: ${widget.user.credit.toStringAsFixed(0)} هزار تومان",
            style: TextStyle(
                color: current == ThemeMode.light ||
                        (current == ThemeMode.system &&
                            ThemeMode.system == ThemeMode.light)
                    ? Colors.black
                    : Colors.white,
                fontSize: 18,
                fontFamily: "IranSansNum",
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment').then((value) {
                  setState(() {});
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: current == ThemeMode.light
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                "افزایش اعتبار",
                style: TextStyle(
                    color: current == ThemeMode.light ||
                            (current == ThemeMode.system &&
                                ThemeMode.system == ThemeMode.light)
                        ? Colors.white
                        : Colors.black,
                    fontFamily: "IranSans"),
              ),
            ),
          )
        ],
      );
    }

    Widget optionsTile(String title, IconData icon, Function fun) {
      return InkWell(
        onTap: fun,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "IranSans"),
                  )
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 18,
              )
            ],
          ),
        ),
      );
    }

    Widget themeSelecting() {
      return Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.palette,
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              Text("ظاهر برنامه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "IranSans")),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                              "assets/images/theme/lightMode.png"))),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "روشن",
                    style: TextStyle(
                      fontFamily: "IranSans",
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Radio(
                      value: ThemeMode.light,
                      groupValue: current,
                      onChanged: (m) {
                        setState(() {
                          current = m;
                          MyApp.of(context).changeTheme(ThemeMode.light);
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white))
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child:
                              Image.asset("assets/images/theme/darkMode.png"))),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "تاریک",
                    style: TextStyle(
                      fontFamily: "IranSans",
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Radio(
                      value: ThemeMode.dark,
                      groupValue: current,
                      onChanged: (m) {
                        setState(() {
                          current = m;
                          MyApp.of(context).changeTheme(ThemeMode.dark);
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white))
                ],
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
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
        child: Center(
          child: Column(
            children: [
              userDetails(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.6,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      optionsTile("ویرایش اطلاعات", Icons.edit, () {
                        Navigator.pushNamed(context, '/edit').then((value) {
                          setState(() {});
                        });
                      }),
                      const SizedBox(
                        height: 6,
                      ),
                      const Divider(
                        color: Colors.white60,
                        height: 15,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      optionsTile(
                          "نظرهای من", Icons.mode_comment_outlined, () {}),
                      const SizedBox(
                        height: 6,
                      ),
                      const Divider(
                        color: Colors.white60,
                        height: 15,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      optionsTile(
                          "دعوت از دوستان", Icons.person_add_alt_1, () {}),
                      const SizedBox(
                        height: 6,
                      ),
                      const Divider(
                        color: Colors.white60,
                        height: 15,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      optionsTile("خرید اشتراک ویژه",
                          Icons.monetization_on_outlined, () {Navigator.pushNamed(context, "/payment");}),
                      const SizedBox(
                        height: 6,
                      ),
                      const Divider(
                        color: Colors.white60,
                        height: 15,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      themeSelecting(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: deviceSize.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor),
                child: TextButton(
                  child: const Text(
                    "خروج از حساب کاربری",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: "IranSans",
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
