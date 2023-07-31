import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({super.key});

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation> {
  double myAngle = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -170,
            child: CircleAvatar(
              radius: 210,
              backgroundColor:
                  const Color.fromARGB(255, 168, 133, 118).withOpacity(0.31),
              child: AnimatedRotation(
                //angle
                turns: myAngle,
                curve: Curves.bounceOut,
                duration: const Duration(seconds: 2),
                child: const Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: -81,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 81,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myAngle -= 1;
          });
        },
        child: const Text('Tap'),
      ),
    );
  }
}
