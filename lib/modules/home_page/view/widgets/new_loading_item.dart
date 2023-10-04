import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/size_config.dart';

class NewLoadingItem extends StatelessWidget {
  const NewLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(getWidth(12)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 188, 182, 182),
        highlightColor: const Color.fromARGB(255, 255, 255, 255),
        child: Container(
          width: getWidth(135),
          height: getHeight(250),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.withOpacity(.9),
          ),
        ),
      ),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(
        width: getWidth(15),
      ),
    );
  }
}
