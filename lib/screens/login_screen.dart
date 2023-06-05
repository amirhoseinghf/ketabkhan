import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ketabkhan/main.dart';
import './register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();
  ThemeMode themeMode;

  LoginScreen(this.themeMode);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: deviceSize.height * 0.53,
                width: deviceSize.width * 0.8,
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(
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

                          const SizedBox(
                            height: 35,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      label: const Text("ایمیل"),
                                      labelStyle: const TextStyle(fontSize: 20),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      suffixIcon: const Icon(Icons.mail)),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (result) {
                                    if (result.isEmpty) {
                                      return "لطفا ایمیل خود را وارد کنید.";
                                    }
                                  },
                                  style: Theme.of(context).textTheme.headlineSmall,
                                  onChanged: (result) {
                                    email = result;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      label: const Text("رمز عبور"),
                                      labelStyle: const TextStyle(fontSize: 20),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      suffixIcon: const Icon(Icons.key)),
                                  validator: (result) {
                                    if (result.isEmpty) {
                                      return "لطفا رمز عبور خود را وارد کنید.";
                                    }
                                  },
                                  onChanged: (result) {
                                    password = result;
                                  },
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if(_formKey.currentState.validate()) {
                                        if(email == MyApp.of(context).appUser.email && password == MyApp.of(context).appUser.password) {
                                          Navigator.pushNamed(context, '/main');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.done_all_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "با موفقیت وارد شدید.",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily: "IranSansNum"),
                                                    ),
                                                  ],
                                                )),
                                            backgroundColor: Colors.green,
                                            duration: const Duration(seconds: 3),
                                          ));
                                        }
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Theme.of(context).buttonColor),
                                    ),
                                    child: Text(
                                      "ورود",
                                      style: Theme.of(context).textTheme.titleMedium
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(RegisterScreen.routeName);
                                    },
                                    child: Text(
                                      "ثبت نام در کتابخوان",
                                      style: Theme.of(context).textTheme.bodyMedium,
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
