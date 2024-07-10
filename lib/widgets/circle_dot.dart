import 'package:flutter/material.dart';

class CircleDot extends StatelessWidget {
  const CircleDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2),
      ),
      child: const CircleAvatar(
        maxRadius: 8,
        backgroundColor: Colors.black,
      ),
    );
  }
}
