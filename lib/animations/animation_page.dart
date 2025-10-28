import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ).animate().fade().move(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: () {
              _controller.forward();
            },
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.repeat(reverse: false);
            },
          ),
        ],
      ),
    );
  }
}
