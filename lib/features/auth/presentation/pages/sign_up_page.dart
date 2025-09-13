import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/core/theme/app_text_styles.dart';
import 'package:guruh5/core/widgets/app_buttons.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_state.dart';
import 'package:guruh5/features/auth/presentation/pages/verify_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool hasMinimum() {
    return RegExp(r'.{8,}').hasMatch(_passwordController.text);
  }

  bool hasNumber() {
    return RegExp(r'\d').hasMatch(_passwordController.text);
  }

  bool hasLowerAndUpper() {
    return RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(_passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(24.0),
          children: [
            Text(
              "Sign Up",
              style: AppTextStyles.h1.copyWith(color: Color(0xFF121212)),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _nameController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Iltimos to'ldiring";
                  }
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Iltimos to'ldiring";
                  }
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
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
      ),
      bottomNavigationBar: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BlocProvider(
                      create: (context) => AuthCubit(),
                      child: VerifyPage(email: _emailController.text.trim()),
                    ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(24.0).copyWith(bottom: 40.0),
            child: PrimaryButton(
              title: state is AuthLoading ? 'Loading...' : 'Sign Up',
              onPressed:
                  state is AuthLoading ||
                          !hasMinimum() ||
                          !hasNumber() ||
                          !hasLowerAndUpper()
                      ? null
                      : () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<AuthCubit>().signUp(
                            email: _emailController.text.trim(),
                            name: _nameController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        }
                      },
            ),
          );
        },
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
