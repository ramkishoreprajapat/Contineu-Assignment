import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'logic/bloc/autentication_bloc/authentication_bloc.dart';
import 'my_app_view.dart';
import 'presentation/router/app_router.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final UserRepository userRepository;
  const MyApp(
      {super.key, required this.appRouter, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository),
      child: MyAppView(
        appRouter: appRouter,
      ),
    );
  }
}
