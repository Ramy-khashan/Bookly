import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import 'custom_network_image.dart';

class ShowBookInfoItem extends StatelessWidget {
  final String bookImage;
  final String bookTitle;
  final String id;
  final String bookAuther;
  final String bookPrice;
  final String bookRate;
  final String bookViewer;
  const ShowBookInfoItem(
      {super.key,
      required this.bookImage,
      required this.bookTitle,
      required this.bookAuther,
      required this.bookPrice,
      required this.bookRate,
      required this.bookViewer, required this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          Hero(
                    tag: id,
          child: CustomNetworkImage(
              width: 120, height: 150, radius: 15, imageUrl: bookImage),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(getWidth(10)),
          height: getHeight(130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookTitle,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: getFont(22), fontWeight: FontWeight.bold),
              ),
              Text(
                bookAuther,
                maxLines: 1,
                style: TextStyle(
                  fontSize: getFont(20),
                ),
              ),
              Row(
                children: [
                  Text(
                    bookPrice,
                    style: TextStyle(
                        fontSize: getFont(20), fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.star_outlined,
                    color: Colors.amber.shade600,
                  ),
                  Text(
                    bookRate == "null" ? "0" : bookRate,
                    style: TextStyle(
                        fontSize: getFont(16), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: getWidth(5),
                  ),
                  Text(
                    bookViewer == "null" ? "( 0 )" : "( $bookViewer )",
                    style: TextStyle(
                      fontSize: getFont(16),
                    ),
                  )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
