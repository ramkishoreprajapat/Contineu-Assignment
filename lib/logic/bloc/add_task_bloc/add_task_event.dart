part of 'add_task_bloc.dart';

sealed class AddTaskEvent extends Equatable {
  const AddTaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskRequired extends AddTaskEvent {
  final Task task;

  const AddTaskRequired(this.task);
}
