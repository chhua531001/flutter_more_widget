import 'package:flutter/material.dart';
import 'package:flutter_more_widget/widgets/animated_text_widget.dart';

class AnimatedTextPage extends StatelessWidget {
  const AnimatedTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Text Demo"),
      ),
      body: AnimatedTextWidget(),
    );
  }
}
