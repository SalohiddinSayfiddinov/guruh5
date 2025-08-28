import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  double height = 100;
  double width = 100;

  bool brokkoli = false;
  bool strawberry = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.0,
          children: [
            // Checkbox(value: value, onChanged: onChanged)
            // Switch(value: value, onChanged: onChanged)
            // Slider
            // Radio
            InkWell(
              onTap: () {
                setState(() {
                  brokkoli = !brokkoli;
                });
              },
              child: Container(
                height: height,
                width: width,
                color: brokkoli ? Colors.black : Colors.red,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  strawberry = !strawberry;
                });
              },
              child: Container(
                height: height,
                width: width,
                color: strawberry ? Colors.black : Colors.red,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (strawberry) {
            print("Qulpnay yoqadi");
          } else {
            print("Qulpnay yoqmaydi");
          }
          if (brokkoli) {
            print('O\'sha yoqadi');
          } else {
            print('O\'sha yoqmaydi');
          }
        },
      ),
    );
  }
}



/* 



*/