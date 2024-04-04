import 'package:bookly/Features/auth/login_screen.dart';
import 'package:bookly/Features/user/not_activated.dart';
import 'package:bookly/Features/user/home/presentation/views/users_home_screen.dart';
import 'package:flutter/material.dart';
import 'Features/Splash/presentation/views/splash_view.dart';
import 'Features/admin/admin_screens/add_new_book.dart';
import 'Features/admin/admin_screens/admin_home_screen.dart';
import 'Features/auth/signup_screen.dart';
import 'core/utils/strings.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case usersHomeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case adminHomeScreen:
        return MaterialPageRoute(builder: (_) => const AdminHomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case addNewBook:
        return MaterialPageRoute(builder: (_) => const AddBookScreen());
      case notActivated:
        return MaterialPageRoute(builder: (_) => const NotActivated());
    }
  }
}
