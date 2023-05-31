import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String userName;
  String password;

  var _formKey = GlobalKey<FormState>();


  @override
      Widget build(BuildContext context) {

        final deviceSize = MediaQuery.of(context).size;
        return Scaffold(
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: Container(
                    height: deviceSize.height * 0.6,
                    width: deviceSize.width * 0.8,
                    child: Card(
                      elevation: 3,
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18,
                              ),
                              // Header
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "ثبت نام",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 1,
                                    child: Container(color: Theme.of(context).primaryColor),
                                  ),
                                  SvgPicture.asset("assets/images/logofinal2.svg",
                                      height: 50),
                                ],
                              ),

                              SizedBox(
                                height: 35,
                              ),

                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [

                                    // Email Field
                                    TextFormField(
                                      decoration: InputDecoration(
                                          label: Text("ایمیل"),
                                          labelStyle: TextStyle(fontSize: 20),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)),
                                          suffixIcon: Icon(Icons.mail)),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (emailAddress) {
                                        if (emailAddress.length == 0) return "مقدار ایمیل نمی تواند خالی باشد";
                                        else if (!emailAddress.contains("@") || !emailAddress.contains(".")) return "ایمیل شما نامعتبر می باشد";
                                      },
                                    ),

                                    SizedBox(
                                      height: 15,
                                    ),


                                    // Username Field
                                    TextFormField(
                                      decoration: InputDecoration(
                                          label: Text("نام کاربری"),
                                          labelStyle: TextStyle(fontSize: 20),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)),
                                          suffixIcon: Icon(Icons.person)),
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (user) => userName = user,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),


                                    // Password Field
                                    TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          label: Text("رمز عبور"),
                                          labelStyle: TextStyle(fontSize: 20),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)),
                                          suffixIcon: Icon(Icons.key)),
                                      validator: (password) {
                                        if (password.length < 8) return "رمز عبور شما باید حداقل دارای 8 کاراکتر باشد.";
                                        else if (password.contains(userName)) return "رمز عبور شما نمی تواند شامل نام کاربری شما باشد.";
                                      },
                                      onChanged: (pass) => password = pass,
                                    ),


                                    SizedBox(
                                      height: 15,
                                    ),

                                    // Password repeat field
                                    TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          label: Text("رمز عبور"),
                                          labelStyle: TextStyle(fontSize: 20),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15)),
                                          suffixIcon: Icon(Icons.key)),
                                      validator: (value) {if (value != password) return "رمز عبور شما یکسان نیست";},
                                    ),

                                    SizedBox(
                                      height: 15,
                                    ),

                                    // Sign up button
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {if(_formKey.currentState.validate()) {
                                          print("Done");
                                        }},
                                        child: Text("ثبت نام", style: TextStyle(fontSize: 17),),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              Theme.of(context).primaryColor),
                                        ),
                                      ),
                                    ),

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