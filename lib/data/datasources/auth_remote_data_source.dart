import 'package:dio/dio.dart';
import 'package:training_project/data/models/login_response_model.dart';
import '../models/user_model.dart';
import '../models/login_request_model.dart';

class AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSource(this.dio);

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    print('GỬI REQUEST LOGIN: ${request.toJson()}');
    try {
      final response = await dio.post(
        'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/auth-service/login',
        data: request.toJson(),
      );
      print('RESPONSE LOGIN:  [32m${response.statusCode} - ${response.data} [0m');
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e, stack) {
      print('LỖI LOGIN: $e');
      print('STACKTRACE: $stack');
      rethrow;
    }
  }

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    print(
      'GỬI REQUEST SIGNUP: {firstName: $firstName, lastName: $lastName, email: $email, password: $password}',
    );
    try {
      final response = await dio.post(
        'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/auth-service/register',
        data: {
          'username': email,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );
      print('RESPONSE SIGNUP: ${response.statusCode} - ${response.data}');
      if (response.statusCode != 201) {
        throw Exception('Sign up failed: ${response.statusCode}');
      }
    } catch (e, stack) {
      print('LỖI SIGNUP: $e');
      print('STACKTRACE: $stack');
      rethrow;
    }
  }
}
