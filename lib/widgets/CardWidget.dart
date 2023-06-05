import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  int cardNumber = 0;
  int cvv2;

  CardWidget(this.cardNumber, this.cvv2);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  Image s(String cardNumStr) {
    if (cardNumStr.startsWith("603799")) {setState(() {
      return Image.asset("assets/images/MelliCard.png");
    });} else if (cardNumStr.startsWith("610433")) {setState(() {
      return Image.asset("assets/images/mellatCard.png");
    });} else {
      setState(() {
        return Image.asset("assets/images/defaultCard.png");
      });
    }
  }

  Image img;

  @override
  Widget build(BuildContext context) {
    String cardNumberToString = widget.cardNumber.toString();


    void imgSet() {
      if (cardNumberToString.startsWith("603799")) {
        setState(() {
          img = Image.asset("assets/images/MelliCard.png", fit: BoxFit.cover,);
        });
      } else if (cardNumberToString.startsWith("6104")) {
        setState(() {
          img = Image.asset("assets/images/mellatCard.png", fit: BoxFit.cover,);
        });
      } else {
        setState(() {
          img = Image.asset("assets/images/defaultCard.png", fit: BoxFit.cover,);
        });
      }
    }
    imgSet();

    var buffer = new StringBuffer();
    for (int i = 0; i < cardNumberToString.length; i++) {
      buffer.write(cardNumberToString[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != cardNumberToString.length) {
        buffer.write('  '); // Replace this with anything you want to put after each 4 numbers
      }
    }

    var string = buffer.toString();
    // return cardNumberToString.copyWith(
    //     text: string,
    //     selection: new TextSelection.collapsed(offset: string.length)
    // );

    return Center(
      child: Container(
        height: 200,
        width: 300,
        // color: Colors.blue,
        child: Stack(children: [
          Container(
              height: 270,
              width: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(blurRadius: 3, blurStyle: BlurStyle.outer,),]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: img)),
          Positioned(
              bottom: 47,
              left: 48,
              child: cardNumberToString.length < 16 ? Text(string, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "IranSansNum"),) : Text("${cardNumberToString.substring(0,4)}  ${cardNumberToString.substring(4,8)}  ${cardNumberToString.substring(8,12)}  ${cardNumberToString.substring(12,16)}", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "IranSansNum"),)),
          Positioned(
              bottom: 19,
              left: 20,
              child: Text("CVV2 : ${widget.cvv2}", style: TextStyle(fontSize: 11.5, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "IranSansNum"),))
        ],),
      ),
    );
  }
}
