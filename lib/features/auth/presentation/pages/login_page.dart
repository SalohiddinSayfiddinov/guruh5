import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(22.0),
          children: [
            Text(
              'Please enter your data to login',
              style: TextStyle(fontSize: 25.0),
            ),
            _buildInputField(
              context,
              _emailController,
              'Email',
              'Enter your email',
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Iltimos email kiriting";
                  }
                }
                return null;
              },
            ),
            _buildInputField(
              context,
              _passwordController,
              'Password',
              'Enter your Password',
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Iltimos parol kiriting";
                  }
                }
                return null;
              },
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
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(22.0).copyWith(bottom: 30.0),
            child: SizedBox(
              width: double.infinity,
              height: 44.0,
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child:
                    state is AuthLoading
                        ? CircularProgressIndicator.adaptive()
                        : Text('Login'),
              ),
            ),
          );
        },
      ),
    );
  }

  Column _buildInputField(
    BuildContext context,
    TextEditingController controller,
    String title,
    String hint, {
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Text(title, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
        SizedBox(height: 4.0),
        TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
