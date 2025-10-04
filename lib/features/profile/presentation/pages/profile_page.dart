import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/profile/presentation/cubit/image_cubit.dart';
import 'package:guruh5/features/profile/presentation/cubit/image_state.dart';
import 'package:guruh5/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:guruh5/features/profile/presentation/cubit/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              if (pickedImage == null) return;
              context.read<ProfileCubit>().uploadImage(pickedImage!);
            },
            child:
                state is ProfileLoading
                    ? CircularProgressIndicator.adaptive()
                    : Icon(Icons.add),
          );
        },
      ),
      body: BlocConsumer<ImageCubit, ImageState>(
        listener: (context, state) {
          if (state is ImageError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is ImageSuccess) {
            pickedImage = File(state.image.path);
          }
        },
        builder: (context, state) {
          if (state is ImageLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is ImageSuccess && pickedImage != null
                    ? Image(image: FileImage(pickedImage!))
                    : CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.blue.shade200,
                    ),

                SizedBox(height: 20.0),
                SizedBox(
                  height: 44.0,
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ImageCubit>().pickImage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                    ),
                    child: Text("Pick Image"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
