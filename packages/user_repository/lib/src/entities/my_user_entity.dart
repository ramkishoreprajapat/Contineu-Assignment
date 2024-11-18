import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String deviceId;

  const MyUserEntity(
      {required this.userId, required this.email, required this.name, required this.deviceId});

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'deviceId': deviceId,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        userId: doc['userId'], email: doc['email'], name: doc['name'], deviceId: doc['deviceId']);
  }

  @override
  List<Object?> get props => [userId, email, name, deviceId];
}
