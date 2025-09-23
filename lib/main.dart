import 'package:flutter/material.dart';
import 'package:guruh5/core/routes/app_pages.dart';
import 'package:guruh5/core/routes/app_routes.dart';
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
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppPages.splash,
    );
  }
}
