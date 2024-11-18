import 'package:contineu_assignment/presentation/screens/tasks/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/strings.dart';
import 'core/theme/theme.dart';
import 'core/theme/util.dart';
import 'core/utils/navigation_service.dart';
import 'logic/bloc/autentication_bloc/authentication_bloc.dart';
import 'logic/bloc/forget_password_bloc/forget_password_bloc.dart';
import 'logic/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'logic/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'presentation/router/app_router.dart';
import 'presentation/screens/authentications/login_screen.dart';

class MyAppView extends StatelessWidget {
  final AppRouter appRouter;
  const MyAppView({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "ABeeZee", "ABeeZee");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
        BlocProvider(
          create: (context) => SignInBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: Strings.appName,
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        debugShowCheckedModeBanner: false,
        // initialRoute: AppRouter.login,
        onGenerateRoute: appRouter.onGenerateRoutes,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              /* return FutureBuilder(
                future: Future.delayed(const Duration(seconds: 3)),
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.done
                        ? const HomeScreen()
                        : const SplashScreen(),
              ); */
              return const TaskListScreen();
            } else {
              /* return FutureBuilder(
                future: Future.delayed(const Duration(seconds: 3)),
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.done
                        ? const LoginScreen()
                        : const SplashScreen(),
              ); */

              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
