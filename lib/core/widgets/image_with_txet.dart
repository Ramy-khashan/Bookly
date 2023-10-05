import 'package:flutter/material.dart'; 

import '../utils/size_config.dart';

class ImageWithTextItem extends StatelessWidget {
  final String image;
  final String head;
  const ImageWithTextItem({super.key, required this.image, required this.head});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
       image,
          color:Theme.of(context).brightness.index==0?Colors.white: Colors.black,
        ),
        SizedBox(
          height: getHeight(25),
        ),
        Text(
          head,
          style: TextStyle(fontSize: getFont(28), fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
