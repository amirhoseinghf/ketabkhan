import 'package:flutter/material.dart';

class CurrentReadingBookWidget extends StatelessWidget {

  String name;
  String imageUrl;

  CurrentReadingBookWidget(this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl, fit: BoxFit.cover,))),
          SizedBox(height: 10,),
          Text(name, style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.all(3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Icon(Icons.percent, size: Theme.of(context).textTheme.bodySmall.fontSize, color: Colors.white,),
              SizedBox(width: 3,),
              Text("24", style: Theme.of(context).textTheme.bodySmall),
            ],),
          ),
        ],
      ),
    );
  }
}
