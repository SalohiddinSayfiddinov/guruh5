import 'package:flutter/material.dart';
import 'package:guruh5/features/auth/data/models/user_model.dart';
import 'package:guruh5/features/auth/presentation/provider/user_provider.dart';
import 'package:guruh5/features/home/presentation/pages/home_page.dart';
import 'package:guruh5/features/home/presentation/provider/post_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _cityController.dispose();
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
              _nameController,
              'Name',
              'Enter your name',
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Iltimos ism kiriting";
                  }
                }
                return null;
              },
            ),
            _buildInputField(
              context,
              _lastNameController,
              'Last name',
              'Enter your last name',
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Iltimos familiya kiriting";
                  }
                }
                return null;
              },
            ),
            _buildInputField(
              context,
              _cityController,
              'City',
              'Where do you live',
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Iltimos shaxar kiriting";
                  }
                }
                return null;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<UserProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: EdgeInsets.all(22.0).copyWith(bottom: 30.0),
            child: SizedBox(
              width: double.infinity,
              height: 44.0,
              child: ElevatedButton(
                onPressed:
                    provider.isLoggingIn
                        ? null
                        : () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            final User user = User(
                              id: '',
                              name: _nameController.text.trim(),
                              lastname: _lastNameController.text.trim(),
                              city: _cityController.text.trim(),
                            );
                            await context.read<UserProvider>().login(user);

                            if (provider.loginSuccess != null) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ChangeNotifierProvider(
                                        create: (context) => PostProvider(),
                                        child: HomePage(),
                                      ),
                                ),
                                (route) => false,
                              );
                            } else {
                              print('Else ishladi');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text(provider.loginError!),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child:
                    provider.isLoggingIn
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
