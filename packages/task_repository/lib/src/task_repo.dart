import 'models/models.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<List<Task>> getTask();
  Future<void> deleteTask(String id);
}
