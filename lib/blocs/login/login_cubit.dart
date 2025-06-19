import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/blocs/data/login/login_request.dart';
import 'package:training_project/blocs/data/login/login_response.dart';
import 'package:training_project/storage/storage.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  final Dio dio = Dio();

  Future<void> login(String email, String password) async {
    bool emailInvalid = !(email.length > 11 && email.endsWith('mail.com'));
    bool passwordInvalid =
        !RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$').hasMatch(password);

    if (!emailInvalid && !passwordInvalid) {
      emit(state.copyWith(isLoading: true));
      try {
        final response = await dio.post(
          'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/auth-service/login',
          data: LoginRequest(email: email, password: password).toJson(),
        );
        if (response.statusCode == 200) {
          print('Đăng nhập thành công!');
          print('Response data: ${response.data}');
          LoginResponse loginResponse = LoginResponse.fromJson(response.data);
          await Storage().saveTokens(loginResponse.accessToken, loginResponse.refreshToken);
          emit(state.copyWith(loginSuccess: true, isLoading: false));
        } else {
          print('Đăng nhập thất bại: mã lỗi ${response.statusCode}');
        }
      } catch (e) {
        print('Lỗi đăng nhập: $e');
        emit(state.copyWith(loginSuccess: false, isLoading: false));
      }
    }
  }

  void resetSuccess() {
    emit(state.copyWith(loginSuccess: false));
  }

  void onInputChanged(String email, String password) {
    final isEmailValid = email.length > 11 && email.endsWith('mail.com');
    final isPasswordValid = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$',
    ).hasMatch(password);

    emit(
      state.copyWith(
        isEmailInvalid: !isEmailValid,
        isPasswordInvalid: !isPasswordValid,
        isLoginButtonEnabled: isEmailValid && isPasswordValid,
      ),
    );
  }

  void toggleShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
}
