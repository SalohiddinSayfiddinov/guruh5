import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: 1,
          child: Container(
            color: Colors.red,
            height: 200,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
