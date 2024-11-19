part of 'list_task_bloc.dart';

sealed class ListTaskEvent extends Equatable {
  const ListTaskEvent();

  @override
  List<Object> get props => [];
}

class ListTaskRequired extends ListTaskEvent {
  const ListTaskRequired();
}

class DeleteTaskRequired extends ListTaskEvent {
  final String id;
  const DeleteTaskRequired(this.id);
}

class RefreshTaskRequired extends ListTaskEvent {
  const RefreshTaskRequired();
}

