import 'package:flutter/material.dart';

class HeartAnimation extends StatefulWidget {
  const HeartAnimation({super.key});

  @override
  State<HeartAnimation> createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;
  bool forward = false;

  handleOnTap() {
    setState(() {
      !_controller.isCompleted ? forward = true : forward = false;
    });
    !_controller.isCompleted ? _controller.forward() : _controller.reset();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween(begin: 50, end: 70), weight: 45),
        TweenSequenceItem(tween: Tween(begin: 70, end: 50), weight: 45),
        TweenSequenceItem(tween: Tween(begin: 50, end: 70), weight: 45),
        TweenSequenceItem(tween: Tween(begin: 70, end: 50), weight: 45),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return InkWell(
              onTap: handleOnTap,
              child: Icon(
                forward ? Icons.favorite : Icons.favorite_outline,
                color: forward ? Colors.red : Colors.grey,
                size: _sizeAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}
