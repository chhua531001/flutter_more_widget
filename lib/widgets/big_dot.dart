import 'package:flutter/material.dart';

class BigDot extends StatelessWidget {
  const BigDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        //因為它的上層height=40, 若是要為圓必須width=36+(padding 2*2)
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          border: Border.all(
            width: 10,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
