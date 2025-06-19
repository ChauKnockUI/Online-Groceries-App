import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/blocs/data/signUp/register_request.dart';
import 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initial());
  final Dio dio = Dio();
  Future <void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await dio.post(
        'https://us-central1-skin-scanner-3c419.cloudfunctions.net/api/auth-service/register',
        data:
            RegisterRequest(
              username: email,
              firstname: firstName,
              lastname: lastName,
              email: email,
              password: password,
            ).toJson(),
      );
      if (response.statusCode == 201) {
        print('Đăng ký thành công!');
        emit(state.copyWith(signUpSuccess: true, isLoading: false));
      } else {
        print('Đăng ký thất bại: mã lỗi ${response.statusCode}');
      }
    } catch (e) {
      emit(
        state.copyWith(
          signUpSuccess: false,
          isLoading: false,
        ),
      );
    }
  }

  void resetSuccess() {
    emit(state.copyWith(signUpSuccess: false));
  }

  void onInputChanged(String email, String password) {
    final isEmailValid = email.length > 11 && email.endsWith('@gmail.com');
    final isPasswordValid = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$',
    ).hasMatch(password);
    emit(
      state.copyWith(
        isEmailInvalid: !isEmailValid,
        isPasswordInvalid: !isPasswordValid,
        isSignUpButtonEnabled: isEmailValid && isPasswordValid,
      ),
    );
  }
}
