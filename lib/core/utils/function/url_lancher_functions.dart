 

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL({required String url}) async { 
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
