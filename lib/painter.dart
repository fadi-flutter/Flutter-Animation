import 'dart:math';
import 'package:flutter/material.dart';

class TwoSemiCircles extends StatefulWidget {
  const TwoSemiCircles({super.key});

  @override
  State<TwoSemiCircles> createState() => _TwoSemiCirclesState();
}

class _TwoSemiCirclesState extends State<TwoSemiCircles>
    with SingleTickerProviderStateMixin {
  late AnimationController animationC;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationC =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 180).animate(animationC);
    animationC.forward();
  }

  @override
  void dispose() {
    animationC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two Semi Circles'),
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: animationC,
        builder: (_, child) {
          return Transform(
            transform: Matrix4.identity()..rotateZ(animation.value),
            child: CustomPaint(
              size: const Size(200, 200),
              painter: TwoSemiCirclesPainter(),
            ),
          );
        },
      )),
    );
  }
}

class TwoSemiCirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Paint paint2 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      -pi / 2,
      pi,
      true,
      paint1,
    );

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      pi / 2,
      pi,
      true,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
