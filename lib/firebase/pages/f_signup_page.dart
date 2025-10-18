import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/firebase/cubit/auth_cubit.dart';
import 'package:guruh5/firebase/cubit/auth_state.dart';

class FSignupPage extends StatelessWidget {
  const FSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Login", style: TextStyle(fontSize: 44))),
      floatingActionButton: BlocConsumer<FAuthCubit, FAuthState>(
        listener: (context, state) {
          if (state is FAuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is FAuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.user!.email.toString())),
            );
          }
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context.read<FAuthCubit>().signUp("test@gmail.com", "test1234");
            },
            child:
                state is FAuthLoading
                    ? CircularProgressIndicator.adaptive()
                    : Icon(Icons.add),
          );
        },
      ),
    );
  }
}
