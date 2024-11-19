import 'package:contineu_assignment/presentation/screens/tasks/add_task_screen.dart';
import 'package:contineu_assignment/presentation/screens/tasks/task_list_screen.dart';
import 'package:flutter/material.dart';

import '../screens/authentications/forget_password.dart';
import '../screens/authentications/login_screen.dart';
import '../screens/authentications/sign_up_screen.dart';
import '../screens/authentications/splash_screen.dart';

class AppRouter {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String home = 'home';
  static const String splash = 'splash';
  static const String forgetPassword = 'forgetPassword';
  static const String addTask = 'addTask';

  Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    Map? args;
    if (routeSettings.arguments != null) {
      args = routeSettings.arguments as Map;
    }

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
        return MaterialPageRoute(builder: (_) => const TaskListScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case addTask:
        return MaterialPageRoute(
            builder: (_) => AddTaskScreen(
                  id: args?['id'] ?? '',
                  title: args?['title'] ?? '',
                  description: args?['description'] ?? '',
                ));
      default:
        throw Exception('Route not found');
    }
  }
}
