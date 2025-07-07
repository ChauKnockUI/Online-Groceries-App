import '../repositories/profile_repository.dart';

class DeleteAccount {
  final ProfileRepository repository;
  DeleteAccount(this.repository);

  Future<void> call() {
    return repository.deleteAccount();
  }
} 