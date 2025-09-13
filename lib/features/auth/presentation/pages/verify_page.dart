import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/core/theme/app_colors.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_state.dart';
import 'package:pinput/pinput.dart';

class VerifyPage extends StatefulWidget {
  final String email;
  const VerifyPage({super.key, required this.email});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final _otpController = TextEditingController();
  void onWrite(String char) {
    setState(() {
      _otpController.text += char;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _otpController.clear();
          });
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0).copyWith(top: 150),
            child: Text(
              'Please write down the OTP that has been sent to ${widget.email}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.0),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              // if (state.isLoading) {
              //   showLoading();
              // } else if (state.error != null) {
              //   Navigator.pop(context);
              //   ScaffoldMessenger.of(
              //     context,
              //   ).showSnackBar(SnackBar(content: Text(state.error!)));
              // } else if (state.message != null) {
              //   Navigator.pop(context);
              //   ScaffoldMessenger.of(
              //     context,
              //   ).showSnackBar(SnackBar(content: Text(state.message!)));

              //   // Navigator();
              // }
            },
            builder: (context, state) {
              return Pinput(
                controller: _otpController,
                onCompleted:
                    (pin) => context.read<AuthCubit>().verify(
                      email: widget.email,
                      otp: _otpController.text,
                    ),
                enabled: false,
              );
            },
          ),
          Spacer(),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 100,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  onWrite('${index + 1}');
                },
                child: Container(
                  color: AppColors.primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
