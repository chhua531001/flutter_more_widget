import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedSearchBarPage extends StatefulWidget {
  const AnimatedSearchBarPage({super.key});

  @override
  State<AnimatedSearchBarPage> createState() => _AnimatedSearchBarPageState();
}

class _AnimatedSearchBarPageState extends State<AnimatedSearchBarPage>
    with SingleTickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late AnimationController
  _animationController; //Animation Controller for rotation the mic icon
  bool isExpanded = false; //Boole to track it the search bar is expanded or not

  @override
  void initState() {
    // TODO: implement initState
    _textEditingController = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AnimatedSearchBar Demo"),
      ),
      body: SizedBox(
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: isExpanded ? 280 : 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: -5,
                  blurRadius: 5,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded; //toggle this isExpanded
                        if (isExpanded) {
                          _animationController
                              .forward(); //start the mic rotation animation
                        } else {
                          FocusScope.of(context).unfocus();
                          _textEditingController.clear();
                          _animationController
                              .reverse(); //reverse the mic rotation animation
                        }
                      });
                    },
                    child: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedOpacity(
                    opacity: isExpanded
                        ? 1
                        : 0, //change opacity base on isExpanded value, initial value is 0 after isExpanded value is 1
                    duration: const Duration(milliseconds: 200),
                    child: TextField(
                      controller: _textEditingController,
                      cursorRadius: const Radius.circular(10),
                      cursorWidth: 2,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search...",
                        labelStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Visibility(
                      visible: isExpanded,  //Visibility base on isExpanded value
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _animationController.value * 2 * pi,
                              child: child,
                            );
                          },
                          child: const Icon(
                            Icons.mic,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
