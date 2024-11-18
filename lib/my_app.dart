import 'package:contineu_assignment/logic/bloc/add_task_bloc/add_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'logic/bloc/autentication_bloc/authentication_bloc.dart';
import 'my_app_view.dart';
import 'presentation/router/app_router.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final UserRepository userRepository;
  final TaskRepository taskRepository;
  const MyApp(
      {super.key, required this.appRouter, required this.userRepository, required this.taskRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(userRepository),
        ),
        RepositoryProvider(
          create: (context) => AddTaskBloc(taskRepository),
        ),
      ],
      child: MyAppView(
        appRouter: appRouter,
      ),
    );
  }
}
