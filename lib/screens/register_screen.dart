import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ketabkhan/main.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";

  ThemeMode themeMode;

  RegisterScreen(this.themeMode, {Key key}) : super(key: key);


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String userName;
  String password;


  final _formKey = GlobalKey<FormState>();


  @override
      Widget build(BuildContext context) {

        final deviceSize = MediaQuery.of(context).size;
        return Scaffold(
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: SizedBox(
                    height: deviceSize.height * 0.72,
                    width: deviceSize.width * 0.8,
                    child: Card(
                      elevation: 3,
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 18,
                              ),
                              // Header
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "ثبت نام",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: widget.themeMode == ThemeMode.dark || (widget.themeMode == ThemeMode.system && ThemeMode.system == ThemeMode.dark) ? Colors.white : Theme.of(context).primaryColor,
                                      fontFamily: "IranSans"
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 1,
                                    child: Container(color: widget.themeMode == ThemeMode.dark || (widget.themeMode == ThemeMode.system && ThemeMode.system == ThemeMode.dark) ? Colors.white :Theme.of(context).primaryColor),
                                  ),
                                  widget.themeMode == ThemeMode.light || (widget.themeMode == ThemeMode.system && ThemeMode.system == ThemeMode.light) ? SvgPicture.asset("assets/images/logofinal2.svg",
                                    height: 50,
                                  ) : SvgPicture.asset("assets/images/logofinal1.svg", height: 50,)
                                ],
                              ),

                              const SizedBox(
                                height: 35,
                              ),

                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [

                                    // Email Field
                                    TextFormField(
                                      decoration: InputDecoration(
                                          label: const Text("ایمیل"),
                                          labelStyle: Theme.of(context).textTheme.headlineSmall,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)),
                                          suffixIcon: const Icon(Icons.mail)),
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (mail) => email = mail,
                                      validator: (emailAddress) {
                                        if (emailAddress.isEmpty) {
                                          return "مقدار ایمیل نمی تواند خالی باشد";
                                        } else if (!emailAddress.contains("@") || !emailAddress.contains(".")) {
                                          return "ایمیل شما نامعتبر می باشد";
                                        }
                                      },
                                      style: Theme.of(context).textTheme.headlineSmall,

                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),


                                    // Username Field
                                    TextFormField(
                                      decoration: InputDecoration(
                                          label: const Text("نام کاربری"),
                                          labelStyle: Theme.of(context).textTheme.headlineSmall,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)),
                                          suffixIcon: const Icon(Icons.person)),
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (user) => userName = user,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),


                                    // Password Field
                                    TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          label: const Text("رمز عبور"),
                                          labelStyle: Theme.of(context).textTheme.headlineSmall,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)),
                                          suffixIcon: const Icon(Icons.key)),
                                      validator: (password) {
                                        if (password.length < 8) {
                                          return "رمز عبور شما باید حداقل دارای 8 کاراکتر باشد.";
                                        } else if (password.contains(userName)) {
                                          return "رمز عبور شما نمی تواند شامل نام کاربری شما باشد.";
                                        }
                                      },
                                      style: Theme.of(context).textTheme.headlineSmall,
                                      onChanged: (pass) => password = pass,
                                    ),


                                    const SizedBox(
                                      height: 15,
                                    ),

                                    // Password repeat field
                                    TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          label: const Text("تکرار رمز عبور"),
                                          labelStyle: Theme.of(context).textTheme.headlineSmall,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)),
                                          suffixIcon: const Icon(Icons.key)),
                                      validator: (value) {if (value != password) return "رمز عبور شما یکسان نیست";},
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    // Sign up button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {if(_formKey.currentState.validate()) {
                                          MyApp.of(context).appUser.userName = userName;
                                          MyApp.of(context).appUser.email = email;
                                          MyApp.of(context).appUser.password = password;

                                          await Socket.connect("10.0.2.2", 2424).then((socket) {
                                            socket.write("sign_up\nemail:$email,,username:$userName,,password:$password\u0000");
                                            print("FDF");
                                          });
                                          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
                                        }},
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              widget.themeMode == ThemeMode.dark || (widget.themeMode == ThemeMode.system && ThemeMode.system == ThemeMode.dark) ? Colors.white :Theme.of(context).primaryColor),
                                        ),
                                        child: Text("ثبت نام", style: TextStyle(fontSize: 17, fontFamily: "IranSans", color: widget.themeMode == ThemeMode.dark || (widget.themeMode == ThemeMode.system && ThemeMode.system == ThemeMode.dark) ? Colors.black : Colors.white),),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    TextButton(child: Text("بازگشت", style: Theme.of(context).textTheme.bodyMedium,), onPressed: () => Navigator.pop(context),)

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
        );
      }
}
