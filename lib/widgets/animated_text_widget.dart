import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: AnimatedTextKit(
          // totalRepeatCount: 5,
          repeatForever: true,
          pause: const Duration(seconds: 1),
          animatedTexts: [
            TyperAnimatedText(
              'Welcome to Flutter!',
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            ScaleAnimatedText(
              'Enjoy Coding....',
              textStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            FadeAnimatedText(
              'Hi, There is Text fades away',
              textStyle: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            RotateAnimatedText(
              'See the next video',
              textStyle: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
