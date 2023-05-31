import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                height: deviceSize.height * 0.53,
                width: deviceSize.width * 0.8,
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
                                  fontSize: 30,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: 30,
                              width: 1,
                              child: Container(
                                  color: Theme.of(context).primaryColor),
                            ),
                            SvgPicture.asset("assets/images/logofinal2.svg",
                                height: 50),
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
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context).primaryColor),
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
                                    style: TextStyle(fontSize: 17),
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
          )),
    );
  }
}
