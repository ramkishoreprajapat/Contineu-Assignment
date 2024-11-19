import 'package:contineu_assignment/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/strings.dart';
import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../core/utils/shared_preference_singleton.dart';
import '../../../logic/bloc/sign_in_bloc/sign_in_bloc.dart';
import '../../../logic/bloc/list_task_bloc/list_task_bloc.dart';
import '../widgets/custom_scaffold.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    super.initState();
    refreshTask();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBartitle: Strings.tasks,
        costomScaffoldEnum: CustomScaffoldEnum.scaffoldWithSafeAreaWithAppBar,
        leading: const Icon(
          Icons.account_circle,
          size: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {
              SharedPreferenceSingleton().setBool(
                  SharedPreferenceSingleton.isDarkTheme,
                  !SharedPreferenceSingleton()
                      .getBool(SharedPreferenceSingleton.isDarkTheme));
            },
            icon: Icon(SharedPreferenceSingleton()
                    .getBool(SharedPreferenceSingleton.isDarkTheme)
                ? Icons.light_mode
                : Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(const SignOutRequired());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        floatingActionButton: FloatingActionButton(
            onPressed: () => {
                  Navigator.of(context)
                      .pushNamed(AppRouter.addTask)
                      .then((isRefresh) {
                    if (isRefresh != null) {
                      refreshTask();
                    }
                  })
                },
            child: const Icon(Icons.add)),
        safeAreaChild: BlocBuilder<ListTaskBloc, ListTaskState>(
          builder: (context, state) {
            if (state is ListTaskSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: state.taskList!.isEmpty
                    ? const Expanded(
                        child: Center(child: Text(Strings.noTaskAddedYet)))
                    : ListView.builder(
                        itemCount: state.taskList!.length,
                        itemBuilder: (context, index) {
                          var item = state.taskList![index];
                          return Card(
                            child: ListTile(
                              title: Text(
                                item.title.length > 10
                                    ? '${item.title.substring(0, 10)}...'
                                    : item.title,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                  item.description.length > 10
                                      ? '${item.description.substring(0, 10)}...'
                                      : item.description,
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 16)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () => {
                                      Navigator.of(context).pushNamed(
                                          AppRouter.addTask,
                                          arguments: {
                                            'id': item.id,
                                            'title': item.title,
                                            'description': item.description,
                                          }).then((isRefresh) {
                                        if (isRefresh != null) {
                                          refreshTask();
                                        }
                                      })
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => {
                                      context
                                          .read<ListTaskBloc>()
                                          .add(DeleteTaskRequired(item.id))
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
              );
            } else {
              return const Expanded(
                  child: Center(child: Text(Strings.loading)));
            }
          },
        ));
  }

  void refreshTask() {
    context.read<ListTaskBloc>().add(const RefreshTaskRequired());
  }
}
