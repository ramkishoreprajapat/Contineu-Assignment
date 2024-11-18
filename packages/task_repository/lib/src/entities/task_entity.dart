import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String userId;
  final String title;
  final String description;

  const TaskEntity(
      {required this.userId, required this.title, required this.description});

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
    };
  }

  static TaskEntity fromDocument(Map<String, dynamic> doc) {
    return TaskEntity(
        userId: doc['userId'], title: doc['title'], description: doc['description']);
  }

  @override
  List<Object?> get props => [userId, title, description];
}
