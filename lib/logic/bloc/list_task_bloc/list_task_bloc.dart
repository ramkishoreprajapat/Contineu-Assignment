import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_repository/task_repository.dart';

import '../../../core/constants/strings.dart';
import '../../../core/utils/utility.dart';

part 'list_task_event.dart';
part 'list_task_state.dart';

class ListTaskBloc extends Bloc<ListTaskEvent, ListTaskState> {
  final TaskRepository taskRepository;

  ListTaskBloc(this.taskRepository) : super(ListTaskInitial()) {
    on<ListTaskRequired>((event, emit) async {
      try {
        var taskList = await taskRepository.getTask();
        emit(ListTaskSuccess(taskList));
      } on FirebaseAuthException catch (e) {
        Utility().debug(e.code);
        emit(const ListTaskFailure(message: Strings.someThingWentWrong));
      } catch (e) {
        emit(const ListTaskFailure());
      }
    });

    on<DeleteTaskRequired>((event, emit) async {
      await taskRepository.deleteTask(event.id);
      emit(ListTaskInitial());
      add(const ListTaskRequired());
    });

    on<RefreshTaskRequired>((event, emit) async {
      emit(ListTaskInitial());
      add(const ListTaskRequired());
    });
  }
}
