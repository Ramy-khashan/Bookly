import 'package:bookly/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DifferantLoadingBookItem extends StatelessWidget {
  const DifferantLoadingBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated( 
         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.all(getWidth(12)),
      shrinkWrap: true,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 204, 197, 197),
        highlightColor: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Container(
              width: getWidth(120),
              height: getHeight(150),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(getWidth(10)),
              height: getHeight(130),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: getHeight(10),
                    color: Colors.green.withOpacity(.9),
                  ),
                  Container(
                    height: getHeight(10),
                    color: Colors.green.withOpacity(.9),
                    width: getWidth(50),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: getHeight(10),
                        color: Colors.green.withOpacity(.9),
                      )),
                      const Spacer(),
                      Expanded(
                          child: Container(
                        height: getHeight(10),
                        color: Colors.green.withOpacity(.9),
                      ))
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
         itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(
                    height: getHeight(15),
                  ),
    );
  }
}
