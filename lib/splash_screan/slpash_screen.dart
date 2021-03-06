import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(child: _AnimatedText()),
    );
  }
}

class _AnimatedText extends StatelessWidget {
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 40,
        color: Colors.white70,
        shadows: [
          Shadow(
            blurRadius: 3,
            color: Colors.white10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Please Wait...'),
        ],
        onTap: () {
          controller.navigateToHomePage();
        },
        pause: Duration(milliseconds: 100),
        repeatForever: true,
      ),
    );
  }
}
