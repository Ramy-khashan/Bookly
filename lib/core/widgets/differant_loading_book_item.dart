 
import '../utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DifferantLoadingBookItem extends StatelessWidget {
  const DifferantLoadingBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.all(getWidth(12)),
      shrinkWrap: true,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 204, 197, 197),
        highlightColor: const Color.fromARGB(255, 255, 255, 255),
        child: GridTile(
          
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200),
          ),
        ),
      ),
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisExtent: 220,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 17,
          mainAxisSpacing: 20),
    );
  }
}
