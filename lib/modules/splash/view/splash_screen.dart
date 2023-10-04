import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';

 import '../../../core/utils/size_config.dart';
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
     Timer(const Duration(milliseconds: 2300), () {
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
                  child:
                  
                     AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'BOOKLY',
                        textStyle: const TextStyle(
                          fontSize:50,
                          fontWeight: FontWeight.bold,
                          fontFamily: "head"
                        ),
                        speed: const Duration(milliseconds: 300),
                      ),
                    ],
                    totalRepeatCount: 1,repeatForever: false, 
                    pause: const Duration(milliseconds: 100),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              ))),
    );
  }
}
