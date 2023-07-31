import 'package:flutter/material.dart';

class HeroAnimation1 extends StatelessWidget {
  const HeroAnimation1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: 'container',
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HeroAnimation2(),
                ),
              );
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation2 extends StatelessWidget {
  const HeroAnimation2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
      ),
      body: Hero(
        tag: 'container',
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 400,
            width: double.infinity,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
