import 'package:flutter/material.dart';

class HalfCircle extends StatelessWidget {
  final bool isRight;
  const HalfCircle({super.key, required this.isRight});

  @override
  Widget build(BuildContext context) {
    //get the Background Color
    ThemeData theme = ThemeData.light();
    Color bgColor = theme.scaffoldBackgroundColor;

    return SizedBox(
      height: 40,
      width: 40,
      child: DecoratedBox(
        decoration: isRight
            ? BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20),
                ),
              )
            : BoxDecoration(
          color: bgColor,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
              ),
      ),
    );
  }
}
