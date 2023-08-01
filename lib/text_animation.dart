// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class TypewriterAnimation extends StatefulWidget {
  const TypewriterAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TypewriterAnimationState createState() => _TypewriterAnimationState();
}

class _TypewriterAnimationState extends State<TypewriterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<Offset> _animation;
  late Animation<AlignmentGeometry> _sizeAnimation;
  double turns = 1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    // _sizeAnimation = Tween<double>(begin: 0, end: 100).animate(_controller);
    _sizeAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.bottomCenter, end: Alignment.topCenter)
        .animate(_controller);
    // _animation = Tween(begin: const Offset(0, -2), end: const Offset(0, 0))
    //     .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    _controller.reset();
    _controller.animateTo(1, curve: Curves.bounceOut);
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FractionalTranslation(
              translation: const Offset(1, 0),
              child: Container(
                color: Colors.lightBlueAccent,
                height: 100,
                width: 100,
              ),
            );
          },
        ),
      ),
    );
  }
}
