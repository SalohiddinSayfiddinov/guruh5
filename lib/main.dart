import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/core/di/injection.dart';
import 'package:guruh5/core/locale/codegen_loader.g.dart';
import 'package:guruh5/firebase/cubit/auth_cubit.dart';
import 'package:guruh5/firebase/data/auth_service.dart';
import 'package:guruh5/firebase/pages/f_signup_page.dart';
import 'package:guruh5/firebase_options.dart';
import 'package:guruh5/providers/theme_provider.dart';
import 'package:guruh5/test_page.dart';
import 'package:provider/provider.dart';

// import 'package:yandex_maps_mapkit_lite/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  // await initMapkit(apiKey: 'Your key');
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ru'), Locale('uz'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('uz'),
      assetLoader: CodegenLoader(),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guruh 5 ning appi',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: context.watch<ThemeProvider>().getCurrentTheme,
      // onGenerateRoute: AppRoutes.generateRoute,
      // initialRoute: AppPages.profile,
      home: AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => TestPage()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder:
                (context) => BlocProvider(
                  create: (context) => FAuthCubit(AuthService()),
                  child: FSignupPage(),
                ),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GAte', style: TextStyle(fontSize: 44.0))),
    );
  }
}
