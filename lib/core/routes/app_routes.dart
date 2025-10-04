import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/core/di/injection.dart';
import 'package:guruh5/core/routes/app_pages.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:guruh5/features/auth/presentation/pages/login_page.dart';
import 'package:guruh5/features/auth/presentation/pages/splash_page.dart';
import 'package:guruh5/features/home/data/repos/vendors_repo.dart';
import 'package:guruh5/features/home/presentation/cubit/home_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/vendor_category_cubit.dart';
import 'package:guruh5/features/home/presentation/cubit/vendors_cubit.dart';
import 'package:guruh5/features/home/presentation/pages/home_page.dart';
import 'package:guruh5/features/home/presentation/pages/vendors_page.dart';
import 'package:guruh5/features/profile/presentation/cubit/image_cubit.dart';
import 'package:guruh5/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:guruh5/features/profile/presentation/pages/profile_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppPages.splash:
        return MaterialPageRoute(builder: (context) => SplashPage());
      case AppPages.home:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => sl<HomeCubit>(),
                child: HomePage(),
              ),
        );
      case AppPages.login:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => AuthCubit(),
                child: LoginPage(),
              ),
        );
      case AppPages.vendors:
        if (args is String) {
          return MaterialPageRoute(
            builder:
                (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => VendorsCubit(repo: VendorsRepo()),
                    ),
                    BlocProvider(
                      create:
                          (context) => VendorCategoryCubit(repo: VendorsRepo()),
                    ),
                  ],
                  child: VendorsPage(title: args),
                ),
          );
        }
        return _noArgsRoute();
      case AppPages.profile:
        return MaterialPageRoute(
          builder:
              (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => ImageCubit()),
                  BlocProvider(create: (context) => sl<ProfileCubit>()),
                ],
                child: ProfilePage(),
              ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (context) => Scaffold(
            body: Center(
              child: Text(
                '404 page not found',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
    );
  }

  static Route<dynamic> _noArgsRoute() {
    return MaterialPageRoute(
      builder:
          (context) => Scaffold(
            body: Center(
              child: Text('No args', style: TextStyle(fontSize: 24.0)),
            ),
          ),
    );
  }
}
