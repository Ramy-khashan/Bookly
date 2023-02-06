import 'package:flutter/material.dart'; 
import 'package:shimmer/shimmer.dart';

import 'core/utils/size_config.dart';

class TestShirmmScreen extends StatelessWidget {
  const TestShirmmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: getHeight(250),
              width: double.infinity,
              child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 188, 182, 182),
                highlightColor: const Color.fromARGB(255, 255, 255, 255), 
                child: Container(
                  height: getHeight(250),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: const Text(
                  'Shimmer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
            // Center(
            //   child: SizedBox(
            //     height: getHeight(250),
            //     child: ListView.separated(
            //       padding: EdgeInsets.all(getWidth(12)),
            //       clipBehavior: Clip.antiAliasWithSaveLayer,
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) =>
            //         Shimmer.fromColors(
            //           baseColor: Colors.red,
            //           enabled: true,
            //           highlightColor: Colors.yellow,
            //           child: Container(
            //             width: 50,
            //             height: getHeight(250),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),

            //       itemCount: 10,
            //       separatorBuilder: (context, index) => SizedBox(
            //         width: getWidth(15),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
