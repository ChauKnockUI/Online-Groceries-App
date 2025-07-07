import '../entities/user.dart';

abstract class ProfileRepository {
  Future<User> getProfile();
  Future<void> deleteAccount();
} 