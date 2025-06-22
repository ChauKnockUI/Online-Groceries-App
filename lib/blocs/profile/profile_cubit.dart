import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';
import 'package:training_project/storage/storage.dart';
import 'dart:convert';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());
  final Dio dio = Dio();
  Future<void> fetchProfile() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final accessToken = await Storage().getAccessToken();
      print('Access Token get profileeeee: $accessToken');
      final response = await dio.get(
        'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/user-service/me',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        print('lay thong tin thanh cong: $data');
        final userInfo = data['data']['userInfo'];
        emit(
          state.copyWith(
            name: userInfo['displayName'],
            email: userInfo['email'],
            isLoading: false,
          ),
        );
      } else {
        emit(state.copyWith(isLoading: false, error: 'Lỗi lấy thông tin'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final accessToken = await Storage().getAccessToken();
      final response = await dio.get(
        'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/scan-service/moles',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200) {
        emit(ProfileState());
      } else {
        emit(state.copyWith(isLoading: false, error: 'Xoá tài khoản thất bại'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
