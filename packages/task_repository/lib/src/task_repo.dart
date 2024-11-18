import 'models/models.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
}
