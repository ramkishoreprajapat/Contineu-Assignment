import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_repository/task_repository.dart';

import '../../../core/constants/strings.dart';
import '../../../core/utils/utility.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final TaskRepository taskRepository;

  AddTaskBloc(this.taskRepository) : super(AddTaskInitial()) {
    on<AddTaskRequired>((event, emit) async {
      try {
        await taskRepository.addTask(event.task);
        emit(const AddTaskSuccess());
        emit(AddTaskInitial());
      } on FirebaseAuthException catch (e) {
        Utility().debug(e.code);
        emit(const AddTaskFailure(message: Strings.someThingWentWrong));
      } catch (e) {
        emit(const AddTaskFailure());
      }
    });
  }
}
