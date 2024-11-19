import 'package:contineu_assignment/presentation/screens/tasks/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/strings.dart';
import 'core/theme/theme.dart';
import 'core/theme/util.dart';
import 'core/utils/navigation_service.dart';
import 'core/utils/shared_preference_singleton.dart';
import 'logic/bloc/add_task_bloc/add_task_bloc.dart';
import 'logic/bloc/autentication_bloc/authentication_bloc.dart';
import 'logic/bloc/forget_password_bloc/forget_password_bloc.dart';
import 'logic/bloc/list_task_bloc/list_task_bloc.dart';
import 'logic/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'logic/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'presentation/router/app_router.dart';
import 'presentation/screens/authentications/login_screen.dart';

class MyAppView extends StatefulWidget {
  final AppRouter appRouter;
  const MyAppView({
    super.key,
    required this.appRouter,
  });

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  bool isDarkTheme = false;

  @override
  void initState() { 
    super.initState();
    isDarkTheme = SharedPreferenceSingleton().getBool(SharedPreferenceSingleton.isDarkTheme);  
  }

  @override
  Widget build(BuildContext context) {
    //If you want theme according to device setting then use below line
    //final brightness = View.of(context).platformDispatcher.platformBrightness;

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
        BlocProvider(
          create: (context) =>
              AddTaskBloc(context.read<AddTaskBloc>().taskRepository),
        ),
        BlocProvider(
          create: (context) =>
              ListTaskBloc(context.read<ListTaskBloc>().taskRepository),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: Strings.appName,
        theme: SharedPreferenceSingleton().getBool(SharedPreferenceSingleton.isDarkTheme) ? theme.dark() : theme.light(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: widget.appRouter.onGenerateRoutes,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return const TaskListScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
