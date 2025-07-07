import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String name, required String email})
      : super(name: name, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['displayName'] ?? '',
      email: json['email'] ?? '',
    );
  }
} 