import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/home/presentation/cubit/counter_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/home_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/post_cubit.dart';
import 'package:guruh5/features/home/presentation/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => PostCubit()),
        ],
        child: HomePage(),
      ),
    );
  }
}
