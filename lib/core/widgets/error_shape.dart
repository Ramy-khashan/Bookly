import 'package:flutter/material.dart'; 

import '../utils/size_config.dart';

class ErrorShape extends StatelessWidget {
  const ErrorShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.report_problem_rounded,size: getWidth(40),),
          SizedBox(
            height: getHeight(10),
          ),
          Text("Somethine Went Wrong",style: TextStyle(fontSize: getFont(30),fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}
