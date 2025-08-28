import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/home/presentation/cubit/home_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/home_state.dart';
import 'package:guruh5/features/home/presentation/cubit/post_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/post_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.isDark ? Colors.black : Colors.white,
          body: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (state.error != null) {
                return Center(child: Text(state.error!));
              } else if (state.posts.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(state.posts[index].title));
                  },
                );
              }
              return SizedBox.shrink();
            },
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 10.0,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<HomeCubit>().increment();
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<HomeCubit>().changeMode();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
