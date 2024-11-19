import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_repository/task_repository.dart';

class FirebaseTaskRepo implements TaskRepository {
  final user = FirebaseAuth.instance.currentUser;
  final tasksCollection = FirebaseFirestore.instance.collection('tasks');

  @override
  Future<void> addTask(Task task) async {
    try {
      var ts = task.copyWith(
        userId: user!.uid,
        createdAt: Timestamp.now().toString()
      );
      if (ts.id.isNotEmpty) {
        //This is for update existing task
        await tasksCollection.doc(ts.id).update(ts.toEntity().toDocument());
      } else {
        //This is for add new task
        await tasksCollection
            .doc(tasksCollection.doc().id)
            .set(ts.toEntity().toDocument());
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Task>> getTask() async {
    Query query = tasksCollection
        .where('userId', isEqualTo: user!.uid);
    QuerySnapshot snapshot = await query.get();
    List<Task> mList = [];
    for (DocumentSnapshot doc in snapshot.docs) {
      var map = doc.data() as Map<String, dynamic>;
      mList.add(Task(
        id: doc.id,
        userId: map['userId'],
        title: map["title"],
        description: map["description"],
        createdAt: map["createdAt"],
      ));
    }

    return mList;
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await tasksCollection.doc(id).delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
