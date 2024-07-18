import 'package:flutter/material.dart';
import 'package:flutter_more_widget/widgets/wrap_widget.dart';

class WrapWidgetPage extends StatelessWidget {
  const WrapWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wrap Widget Demo"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              "Horizontal Wrap",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            WrapWidget(
              axis: Axis.horizontal,
            ),
            SizedBox(height: 10,),
            Text(
              "Vertical Wrap",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 1,
              child: WrapWidget(
                axis: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
