import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ketabkhan/main.dart';
import './register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  ThemeMode themeMode;

  LoginScreen(this.themeMode);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                height: deviceSize.height * 0.53,
                width: deviceSize.width * 0.8,
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          // Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "ورود",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: themeMode == ThemeMode.light ||
                                            (themeMode == ThemeMode.system &&
                                                ThemeMode.system ==
                                                    ThemeMode.light)
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    fontFamily: "IranSans",
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30,
                                width: 1,
                                child: Container(
                                    color: themeMode == ThemeMode.light ||
                                            (themeMode == ThemeMode.system &&
                                                ThemeMode.system ==
                                                    ThemeMode.light)
                                        ? Theme.of(context).primaryColor
                                        : Colors.white),
                              ),
                              themeMode == ThemeMode.light ||
                                      (themeMode == ThemeMode.system &&
                                          ThemeMode.system == ThemeMode.light)
                                  ? SvgPicture.asset(
                                      "assets/images/logofinal2.svg",
                                      height: 50,
                                    )
                                  : SvgPicture.asset(
                                      "assets/images/logofinal1.svg",
                                      height: 50,
                                    )
                            ],
                          ),

                          SizedBox(
                            height: 35,
                          ),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      label: Text("ایمیل"),
                                      labelStyle: TextStyle(fontSize: 20),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      suffixIcon: Icon(Icons.mail)),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      label: Text("رمز عبور"),
                                      labelStyle: TextStyle(fontSize: 20),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      suffixIcon: Icon(Icons.key)),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "ورود",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "IranSans",
                                          color: themeMode == ThemeMode.light ||
                                                  (themeMode ==
                                                          ThemeMode.system &&
                                                      ThemeMode.system ==
                                                          ThemeMode.light)
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(themeMode ==
                                                      ThemeMode.light ||
                                                  (themeMode ==
                                                          ThemeMode.system &&
                                                      ThemeMode.system ==
                                                          ThemeMode.light)
                                              ? Theme.of(context).primaryColor
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(RegisterScreen.routeName);
                                    },
                                    child: Text(
                                      "ثبت نام در کتابخوان",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "IranSans",
                                          color: themeMode == ThemeMode.light ||
                                                  (themeMode ==
                                                          ThemeMode.system &&
                                                      ThemeMode.system ==
                                                          ThemeMode.light)
                                              ? Theme.of(context).primaryColor
                                              : Colors.white),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
