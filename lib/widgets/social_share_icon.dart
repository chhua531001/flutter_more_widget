import 'package:flutter/material.dart';

class SocialShareIcon extends StatefulWidget {
  final int index;
  final String title;
  final IconData icon;
  final Color color;
  final bool isOpen;
  const SocialShareIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.isOpen,
    required this.index,
  });

  @override
  State<SocialShareIcon> createState() => _SocialShareIconState();
}

class _SocialShareIconState extends State<SocialShareIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController
  _animationController; //animation controller for individual items

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SocialShareIcon oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      if (widget.isOpen) {
        Future.delayed(Duration(milliseconds: widget.index * 200), () {
          if (mounted) _animationController.forward();
        });
      }
      else {
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _animationController.value,
          child: Opacity(
            opacity: _animationController.value,
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          widget.icon,
                          size: 40,
                          color: widget.color,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}