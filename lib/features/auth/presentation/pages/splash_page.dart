import 'package:flutter/material.dart';
import 'package:guruh5/features/auth/presentation/pages/login_page.dart';
import 'package:guruh5/features/auth/presentation/provider/user_provider.dart';
import 'package:guruh5/features/home/presentation/pages/home_page.dart';
import 'package:guruh5/features/home/presentation/provider/post_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<UserProvider>().getUsers();
      final users = context.read<UserProvider>().users;
      if (users != null) {
        bool hasRegistered = false;
        for (var element in users) {
          if (element.name.toLowerCase() == 'john') {
            hasRegistered = true;
          }
        }
        if (hasRegistered) {
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ChangeNotifierProvider(
                    create: (context) => UserProvider(),
                    child: LoginPage(),
                  ),
            ),
            (route) => false,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Zo'r app", style: TextStyle(fontSize: 50.0))),
    );
  }
}
