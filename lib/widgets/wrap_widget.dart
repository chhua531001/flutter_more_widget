import 'package:flutter/material.dart';
import 'package:flutter_more_widget/widgets/square_container.dart';

class WrapWidget extends StatelessWidget {
  final Axis axis;
  const WrapWidget({super.key, required this.axis});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: axis,
      runAlignment: WrapAlignment.start,
      runSpacing: 20,
      spacing: 20,
      children: const [
        SquareContainer(
          color: Colors.green,
        ),
        SquareContainer(
          color: Colors.blue,
        ),
        SquareContainer(
          color: Colors.yellowAccent,
        ),
        SquareContainer(
          color: Colors.red,
        ),
        SquareContainer(
          color: Colors.blueGrey,
        ),
        SquareContainer(
          color: Colors.purpleAccent,
        ),
        SquareContainer(
          color: Colors.yellow,
        ),
        SquareContainer(
          color: Colors.amber,
        ),
        SquareContainer(
          color: Colors.purple,
        ),
        SquareContainer(
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
