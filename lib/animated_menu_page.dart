import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_more_widget/widgets/social_share_icon.dart';

class AnimatedMenuPage extends StatefulWidget {
  const AnimatedMenuPage({super.key});

  @override
  State<AnimatedMenuPage> createState() => _AnimatedMenuPageState();
}

class _AnimatedMenuPageState extends State<AnimatedMenuPage>
    with SingleTickerProviderStateMixin {
  //Animation controller for manage animation
  late AnimationController _animationController;
  //Animation for scaling the container
  late Animation<double> _scaleAnimation;
  //Animation for aligning the container
  late Animation<double> _alignAnimation;
  //Animation for changing the border radius
  late Animation<double> _borderRadiusAnimation;
  //Animation for scaling the close icon
  late Animation<double> _iconScaleAnimation;
  //Animation for rotating the close icon
  late Animation<double> _iconRotateAnimation;
  //for check, if the menu is open or close
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    //Initializing the _animationController with a duration
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    //Curve animation to apply easing effect
    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    //Define various animations using Tween and Curved animation
    _scaleAnimation = Tween(
      begin: 59.0,
      end: 200.0,
    ).animate(curvedAnimation);
    _alignAnimation = Tween(
      begin: 0.0,
      end: -1.0,
    ).animate(curvedAnimation);
    _borderRadiusAnimation = Tween(
      begin: 100.0,
      end: 15.0,
    ).animate(curvedAnimation);
    _iconScaleAnimation = Tween(
      begin: 0.0,
      end: 30.0,
    ).animate(curvedAnimation);
    _iconRotateAnimation = Tween(
      begin: 0.0,
      end: math.pi,
    ).animate(curvedAnimation);
  }

  //function to toggle the menu's open/close state
  void toggleMenu() {
    setState(() {
      if (isOpen) {
        _animationController.reverse(); //reverse animation when closing
      } else {
        _animationController.forward(); //forward animation when opening
      }
      isOpen = !isOpen; //toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AnimatedSearchBar Demo"),
      ),
      body: Center(
        //inside this area, we have perform
        child: SizedBox(
          height: 235,
          width: 200,
          child: Stack(
            children: [
              _buildAnimatedContainer(), //Build the animated container
              _buildMenuIcon(), //Build the menu icon and close icon
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedContainer() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Align(
          alignment: Alignment(
            _alignAnimation.value,
            _alignAnimation.value,
          ),
          child: Container(
            height: _scaleAnimation.value,
            width: _scaleAnimation.value,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
            ),
            child: child,
          ),
        );
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SocialShareIcon(
              index: 1,
              title: "Tiktok",
              icon: Icons.tiktok,
              color: Colors.black,
              isOpen: isOpen,
            ),
            SocialShareIcon(
              index: 2,
              title: "Telegram",
              icon: Icons.telegram,
              color: Colors.lightBlue,
              isOpen: isOpen,
            ),
            SocialShareIcon(
              index: 3,
              title: "Discord",
              icon: Icons.discord,
              color: Colors.purple,
              isOpen: isOpen,
            ),
            SocialShareIcon(
              index: 4,
              title: "Facebook",
              icon: Icons.facebook,
              color: Colors.lightBlue,
              isOpen: isOpen,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Align(
          alignment: Alignment(
            _animationController.value,
            _animationController.value,
          ),
          child: InkWell(
            onTap: () {
              toggleMenu();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: _iconRotateAnimation.value,
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                    size: _iconScaleAnimation.value,
                  ),
                ),
                if (_animationController.isDismissed)
                  const Icon(
                    Icons.menu,
                    size: 40,
                    color: Colors.black,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

