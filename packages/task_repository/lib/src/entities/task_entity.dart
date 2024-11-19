import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String createdAt;

  const TaskEntity(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description,
      required this.createdAt,
      });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'createdAt': createdAt,
    };
  }

  static TaskEntity fromDocument(Map<String, dynamic> doc) {
    return TaskEntity(
        id: doc['id'],
        userId: doc['userId'],
        title: doc['title'],
        description: doc['description'],
        createdAt: doc['createdAt'],
        );
  }

  @override
  List<Object?> get props => [id, userId, title, description, createdAt];
}
