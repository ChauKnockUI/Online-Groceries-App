import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../models/login_request_model.dart';

class AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSource(this.dio);
  Future<UserModel> login(LoginRequestModel request) async {
    final response = await dio.post(
      'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/auth-service/login',
      data: request.toJson(),
    );
    if (response.statusCode == 200) {
      // Parse response.data thành UserModel hoặc trả về accessToken tuỳ bạn thiết kế
      return UserModel.fromJson(response.data['user']); // hoặc response.data tuỳ API trả về
    } else {
      throw Exception('Login failed: ${response.statusCode}');
    }
  }

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/auth-service/register',
      data: {
        'username': email,
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode != 201) {
      throw Exception('Sign up failed: ${response.statusCode}');
    }
  }
} 