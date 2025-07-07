import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String email, String password) async {
    final request = LoginRequestModel(email: email, password: password);
    final userModel = await remoteDataSource.login(request);
    return userModel;
  }

  @override
  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await remoteDataSource.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
} 