// ignore_for_file: deprecated_member_use

import '../../../app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL({required String url}) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
    showDialog(
      context: MyApp.navigatorKey.currentContext!,
      builder: (context) => AlertDialog(content: SelectableText( e.toString()),),
    );
  }
}
