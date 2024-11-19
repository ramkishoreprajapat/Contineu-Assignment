part of 'list_task_bloc.dart';

sealed class ListTaskState extends Equatable {
  const ListTaskState();

  @override
  List<Object> get props => [];
}

final class ListTaskInitial extends ListTaskState {}

class ListTaskSuccess extends ListTaskState {
  final List<Task>? taskList;
  const ListTaskSuccess(
    this.taskList,
  );
}

class ListTaskFailure extends ListTaskState {
  final String? message;

  const ListTaskFailure({this.message});
}

class ListTaskProcess extends ListTaskState {}
