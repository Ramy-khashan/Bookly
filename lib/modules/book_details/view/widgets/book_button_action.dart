import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';

class BookBbuttonActionItem extends StatelessWidget {
  final String bookPrice;
  final Function() onTapReview;
  const BookBbuttonActionItem(
      {super.key, required this.bookPrice, required this.onTapReview});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 4,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
                // backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    topLeft: Radius.circular(22),
                    bottomRight: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
              ),
              onPressed: (){},
              child: Text(
               bookPrice,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: getFont(22)),
              )),
        ),
        Expanded(
          flex: 4,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                //  backgroundColor: AppColors.primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    topLeft: Radius.circular(0),
                    bottomRight: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
              ),
              onPressed: onTapReview,
              child: Text(
                "Free preview",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w900,
                    fontSize: getFont(22)),
              )),
        ),
        const Spacer(),
      ],
    );
  }
}
