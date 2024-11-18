import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_repository/task_repository.dart';

class FirebaseTaskRepo implements TaskRepository {
  final user = FirebaseAuth.instance.currentUser;
  final userCollection = FirebaseFirestore.instance.collection('tasks');
  @override
  Future<void> addTask(Task task) async {
    try {
      var ts = task.copyWith(userId: user!.uid);
      await userCollection.doc(userCollection.doc().id).set(ts.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
