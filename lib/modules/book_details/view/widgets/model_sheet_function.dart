import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

showSheet(
        {required BuildContext context,
        required String description,
        required bool isEnglish}) =>
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: getWidth(100),
                height: getHeight(9),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(getWidth(15)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Directionality(
                        textDirection:
                            isEnglish ? TextDirection.ltr : TextDirection.rtl,
                        child: SelectableText(
                          description=="null"?
                                    "No Description Exsist":description,
                          style: TextStyle(
                              fontSize: getFont(20), color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
