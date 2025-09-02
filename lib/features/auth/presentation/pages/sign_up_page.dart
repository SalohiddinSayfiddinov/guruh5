import 'package:flutter/material.dart';
import 'package:guruh5/core/theme/app_text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool hasMinimum() {
    return RegExp(r'.{8,}').hasMatch(_controller.text);
  }

  bool hasNumber() {
    return RegExp(r'\d').hasMatch(_controller.text);
  }

  bool hasLowerAndUpper() {
    return RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: ListView(
        padding: EdgeInsets.all(24.0),
        children: [
          Text(
            "Sign Up",
            style: AppTextStyles.h1.copyWith(color: Color(0xFF121212)),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _controller,
            onChanged: (value) => setState(() {}),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),

          SizedBox(height: 20.0),
          _buildChecker(hasMinimum(), 'Minimum 8 characters'),
          _buildChecker(hasNumber(), 'Atleast 1 number (1-9)'),
          _buildChecker(
            hasLowerAndUpper(),
            'Atleast lowercase or uppercase letters',
          ),
        ],
      ),
    );
  }

  Padding _buildChecker(bool isCorrect, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        spacing: 10.0,
        children: [
          isCorrect
              ? Icon(Icons.done, color: Color(0xFFA28CE0))
              : Icon(Icons.clear, color: Colors.red),
          Text(text),
        ],
      ),
    );
  }
}
