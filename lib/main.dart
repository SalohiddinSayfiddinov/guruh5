import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:guruh5/features/auth/presentation/pages/sign_up_page.dart';
import 'package:guruh5/features/auth/presentation/pages/verify_page.dart';
import 'package:guruh5/features/home/presentation/cubit/home_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/post_cubit.dart';
import 'package:guruh5/test_page.dart';
// import 'package:yandex_maps_mapkit_lite/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initMapkit(apiKey: 'Your key');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guruh 5 ning appi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => PostCubit()),
        ],
        child: SignUpPage(),
      ),
    );
  }
}



/*
git add .
git commit -m 'commit'
git push origin main


 */