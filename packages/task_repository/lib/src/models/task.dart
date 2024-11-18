import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class Task extends Equatable {
  final String userId;
  final String title;
  final String description;

  const Task(
      {required this.userId, required this.title, required this.description});

  static const empty = Task(userId: '', title: '', description: '');

  Task copyWith({String? userId, String? title, String? description}) {
    return Task(
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      userId: userId,
      title: title,
      description: description,
    );
  }

  static Task fromEntity(TaskEntity entity) {
    return Task(
        userId: entity.userId,
        title: entity.title,
        description: entity.description);
  }

  @override
  List<Object?> get props => [userId, title, description];
}
