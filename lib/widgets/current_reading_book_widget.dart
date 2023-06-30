import 'package:flutter/material.dart';

class CurrentReadingBookWidget extends StatelessWidget {
  String name;
  String imageUrl;

  CurrentReadingBookWidget(this.name, this.imageUrl, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              height: 190,
              decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ))),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "IranSans",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
