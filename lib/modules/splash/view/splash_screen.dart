import 'dart:async';

import 'package:bookly/core/utils/app_assets.dart';
import 'package:bookly/core/utils/size_config.dart';
 import 'package:flutter/material.dart';
 
import '../../home_page/view/home_page_screen.dart';
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     Timer(const Duration(milliseconds: 1900), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePageScreen(),
          ),
          (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1200),
          tween: Tween(begin: 0, end: 1),
          builder: ((_, value, __) => Opacity(
                opacity: value,
                child: Center(
                  child: Image.asset(
                  AppAssets.appLogo,
                  color: Colors.white,
                    scale: 1.3,
                  ),
                ),
              ))),
    );
  }
}
