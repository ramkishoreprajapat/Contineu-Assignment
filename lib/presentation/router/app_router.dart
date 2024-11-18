import 'package:flutter/material.dart';

import '../screens/authentications/forget_password.dart';
import '../screens/authentications/login_screen.dart';
import '../screens/authentications/sign_up_screen.dart';
import '../screens/authentications/splash_screen.dart';
import '../screens/home/home_screen.dart';

class AppRouter {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String home = 'home';
  static const String splash = 'splash';
  static const String forgetPassword = 'forgetPassword';

  Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        /*  {
          if (SharedPreferenceSingleton()
              .getBool(SharedPreferenceSingleton.isLogin)) {
            return MaterialPageRoute(
                builder: (_) => CustomBottomNavigationBar());
          } else {
            return MaterialPageRoute(builder: (_) => SplashScreen());
          }
        }
 */
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      default:
        throw Exception('Route not found');
    }
  }
}
