import 'package:contineu_assignment/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../logic/bloc/sign_in_bloc/sign_in_bloc.dart';
import '../widgets/custom_scaffold.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBartitle: 'Home',
        costomScaffoldEnum: CustomScaffoldEnum.scaffoldWithSafeAreaWithAppBar,
        actions: [
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(const SignOutRequired());
            },
            icon: const Icon(Icons.logout),
          ),          
        ],
        floatingActionButton: FloatingActionButton(onPressed: () => {
        Navigator.of(context).pushNamed(AppRouter.addTask)
        }, child: const Icon(Icons.add) ),
        safeAreaChild: Container(),);
  }
}
