import 'package:flutter/material.dart';

class LinProg extends StatelessWidget {


  final int num;
  double percentage = 0.0;


  LinProg(this.num, this.percentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(num.toString(), style: TextStyle(fontFamily: "IranSansNum"),),
          SizedBox(width: 7,),
          Container(
            width: constraints.maxWidth * 0.8,
            child: Stack(children: [
              Container(
                height: 7,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.white),
              ),
               FractionallySizedBox(widthFactor: percentage == 0 ? 0 : percentage, child: Container(
                  height: 7,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.blue),),),

            ],
            ),
          ),
          // Container(height: 7, width: 200, color: Colors.blue,),
        ],
      );
    }

    );
  }
}
