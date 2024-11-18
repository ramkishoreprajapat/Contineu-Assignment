import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String deviceId;

  const MyUser({required this.userId, required this.email, required this.name, required this.deviceId});

  static const empty = MyUser(userId: '', email: '', name: '', deviceId: '');

  MyUser copyWith({String? userId, String? email, String? name, String? deviceId}) {
    return MyUser(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        name: name ?? this.name,
        deviceId: deviceId ?? this.deviceId);
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      deviceId: deviceId,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(userId: entity.userId, email: entity.email, name: entity.name, deviceId: entity.deviceId);
  }

  @override
  List<Object?> get props => [userId, email, name, deviceId];
}
