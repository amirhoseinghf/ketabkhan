import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/CardWidget.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int cardNumber = 0;
  int cvv2 = 0;
  String dropDownMenuValue = "10 هزار تومان";

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
                            return "رمز عبور شما نادرست است.";
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
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(15) ),
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
                              });},
                          style: Theme.of(context).textTheme.titleSmall,
                            iconSize: 0.0,
                            borderRadius: BorderRadius.circular(15),
                            underline: SizedBox(),

                          ),
                        ),
                        Positioned(
                            bottom: 20,
                            right: 260,
                            child: Icon(Icons.keyboard_arrow_down_sharp,)),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Container(
                      width: 170,
                      height: 40,
                      child: ElevatedButton(onPressed: () {}, child: Text("افزایش اعتبار", style: Theme.of(context).textTheme.titleMedium,),
                        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).buttonColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
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
