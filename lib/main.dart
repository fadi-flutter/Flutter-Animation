import 'package:flutter/material.dart';

import 'rotation_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const RotationAnimation(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;
  bool showTheHeart = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween(begin: 50, end: 85), weight: 45),
        TweenSequenceItem(tween: Tween(begin: 85, end: 50), weight: 45),
        TweenSequenceItem(tween: Tween(begin: 50, end: 85), weight: 45),
      ],
    ).animate(_controller);
  }

  showHeart() {
    showTheHeart = true;
    _controller.forward();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showTheHeart = false;
        _controller.reset();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        showHeart();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return showTheHeart
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: _sizeAnimation.value,
                      )
                    : Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
