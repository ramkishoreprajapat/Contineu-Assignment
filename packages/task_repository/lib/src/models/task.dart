import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class Task extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String createdAt;

  const Task(
      {required this.id, required this.userId, required this.title, required this.description, required this.createdAt});

  static const empty = Task(id: '', userId: '', title: '', description: '', createdAt: '');

  Task copyWith({String? id, String? userId, String? title, String? description, String? createdAt}) {
    return Task(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      userId: userId,
      title: title,
      description: description,
      createdAt: createdAt,
    );
  }

  static Task fromEntity(TaskEntity entity) {
    return Task(
        id: entity.id,
        userId: entity.userId,
        title: entity.title,
        description: entity.description,
        createdAt: entity.createdAt,
        );
  }

  @override
  List<Object?> get props => [userId, title, description];

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
}
