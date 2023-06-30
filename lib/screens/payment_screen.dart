import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/user.dart';
import '../widgets/CardWidget.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';
  User user;
  String password;

  PaymentScreen(this.user, {Key key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int cardNumber = 0;
  int cvv2 = 0;
  String dropDownMenuValue = "10 هزار تومان";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          actions: [IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () => Navigator.pop(context),)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CardWidget(cardNumber, cvv2),
              const SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 90,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                "شماره کارت",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon: const Icon(Icons.credit_card_rounded),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              setState(() {
                                cardNumber = int.parse(val);
                              });
                            },
                            maxLength: 16,
                            style: Theme.of(context).textTheme.headlineSmall,
                            validator: (value) {
                              if (value.length != 16) {
                                return "مقدار وارد شده نامعتبر است.";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: 300,
                          height: 90,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                "CVV2",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon: const Icon(Icons.password),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              setState(() {
                                cvv2 = int.parse(val);
                              });
                            },
                            maxLength: 4,
                            style: Theme.of(context).textTheme.headlineSmall,
                            validator: (value) {
                              if (value.length != 4) {
                                return "مقدار نامعتبر";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: 300,
                          height: 90,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              label: Text(
                                "رمز کارت",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon: const Icon(Icons.key_rounded),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                            style: Theme.of(context).textTheme.headlineSmall,
                            validator: (value) {
                              if (value != "3070") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.warning,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "رمز عبور شما نادرست است.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: "IranSansNum"),
                                          ),
                                        ],
                                      )),
                                  backgroundColor: Colors.red,
                                ));
                                return "";
                              }
                              return null;
                            },
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 300,
                              height: 63,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15)),
                              child: DropdownButton(
                                value: dropDownMenuValue,
                                items: [
                                  "10 هزار تومان",
                                  "20 هزار تومان",
                                  "30 هزار تومان",
                                  "40 هزار تومان",
                                ].map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropDownMenuValue = newValue;
                                  });
                                },
                                style: Theme.of(context).textTheme.titleSmall,
                                iconSize: 0.0,
                                borderRadius: BorderRadius.circular(15),
                                underline: const SizedBox(),
                              ),
                            ),
                            const Positioned(
                                bottom: 20,
                                right: 260,
                                child: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 170,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              int amount = 0;
                              if (_formKey.currentState.validate()) {
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
                                            "پرداخت با موفقیت انجام شد.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: "IranSansNum"),
                                          ),
                                        ],
                                      )),
                                  backgroundColor: Colors.green,
                                ));
                                switch (dropDownMenuValue) {
                                  case "10 هزار تومان":
                                    {
                                      widget.user.credit += 10;
                                      amount = 10;
                                      Navigator.pop(context);
                                    }
                                    break;
                                  case "20 هزار تومان":
                                    {
                                      widget.user.credit += 20;
                                      amount = 20;
                                      Navigator.pop(context);
                                    }
                                    break;
                                  case "30 هزار تومان":
                                    {
                                      widget.user.credit += 30;
                                      amount = 30;
                                      Navigator.pop(context);
                                    }
                                    break;
                                  case "40 هزار تومان":
                                    {
                                      widget.user.credit += 40;
                                      amount = 40;
                                      Navigator.pop(context);
                                    }
                                    break;
                                }
                                await Socket.connect("10.0.2.2", 2424).then((socket) {
                                  socket.write("add_credit\n${amount}\u0000");
                                  socket.listen((event) {print(event);});
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).buttonColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Text(
                              "افزایش اعتبار",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
