import '../repositories/auth_repository.dart';

class SignUpUser {
  final AuthRepository repository;
  SignUpUser(this.repository);

  Future<void> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return repository.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
} 