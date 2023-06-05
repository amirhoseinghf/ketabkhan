import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../models/User.dart';
import '../widgets/CardWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';
  User user;
  String password;

  PaymentScreen(this.user);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int cardNumber = 0;
  int cvv2 = 0;
  String dropDownMenuValue = "10 هزار تومان";
  var _formKey = GlobalKey<FormState>();

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
              icon: Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () => Navigator.pop(context),)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CardWidget(cardNumber, cvv2),
              SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
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
                              suffixIcon: Icon(Icons.credit_card_rounded),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (num) {
                              setState(() {
                                cardNumber = int.parse(num);
                              });
                            },
                            maxLength: 16,
                            style: Theme.of(context).textTheme.headlineSmall,
                            validator: (value) {
                              if (value.length != 16) {
                                return "مقدار وارد شده نامعتبر است.";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
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
                              suffixIcon: Icon(Icons.password),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (num) {
                              setState(() {
                                cvv2 = int.parse(num);
                              });
                            },
                            maxLength: 4,
                            style: Theme.of(context).textTheme.headlineSmall,
                            validator: (value) {
                              if (value.length != 4) {
                                return "مقدار نامعتبر";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
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
                              suffixIcon: Icon(Icons.key_rounded),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (num) {},
                            style: Theme.of(context).textTheme.headlineSmall,
                            validator: (value) {
                              if (value != "3070") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Row(
                                        children: [
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
                            },
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 300,
                              height: 63,
                              padding: EdgeInsets.all(10),
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
                                    child: Text(e),
                                    value: e,
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
                                underline: SizedBox(),
                              ),
                            ),
                            Positioned(
                                bottom: 20,
                                right: 260,
                                child: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Row(
                                        children: [
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
                                      Navigator.pop(context);
                                    }
                                    ;                                    break;
                                  case "20 هزار تومان":
                                    {
                                      widget.user.credit += 20;
                                      Navigator.pop(context);
                                    }
                                    ;
                                    break;
                                  case "30 هزار تومان":
                                    {
                                      widget.user.credit += 30;
                                      Navigator.pop(context);
                                    }
                                    ;
                                    break;
                                  case "40 هزار تومان":
                                    {
                                      widget.user.credit += 40;
                                      Navigator.pop(context);
                                    }
                                    ;
                                    break;
                                }
                              }
                            },
                            child: Text(
                              "افزایش اعتبار",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).buttonColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
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
