import '../entities/user.dart';
import '../repositories/profile_repository.dart';

class GetProfile {
  final ProfileRepository repository;
  GetProfile(this.repository);

  Future<User> call() {
    return repository.getProfile();
  }
} 