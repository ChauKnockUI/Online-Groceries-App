import 'package:training_project/data/models/user_model.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import 'package:training_project/storage/storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String email, String password) async {
    final request = LoginRequestModel(email: email, password: password);
    final loginResponse = await remoteDataSource.login(request);
    await Storage().saveTokens(loginResponse.accessToken, loginResponse.refreshToken);
    return UserModel.fromJson(loginResponse.userInfo);
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