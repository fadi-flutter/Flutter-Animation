import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 1, end: 20).animate(_controller);
  }

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    _controller.reset();
    visible = true;
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            visible = false;
            _controller.animateTo(1, curve: Curves.ease);
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Visibility(
                    visible: visible,
                    child: const Icon(
                      Icons.add,
                      size: 38,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.remove,
                  size: 38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
