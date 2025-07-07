import 'package:dio/dio.dart';
import '../models/user_model.dart';

class ProfileRemoteDataSource {
  final Dio dio;
  ProfileRemoteDataSource(this.dio);

  Future<UserModel> getProfile(String accessToken) async {
    final response = await dio.get(
      'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/user-service/me',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
    if (response.statusCode == 200) {
      final userInfo = response.data['data']['userInfo'];
      return UserModel.fromJson(userInfo);
    } else {
      throw Exception('Failed to fetch profile');
    }
  }

  Future<void> deleteAccount(String accessToken) async {
    final response = await dio.get(
      'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/scan-service/moles',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete account');
    }
  }
} 