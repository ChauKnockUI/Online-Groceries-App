import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void login(String email, String password) {
    bool emailInvalid = !(email.length > 11 && email.endsWith('@gmail.com'));
    bool passwordInvalid = !RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$').hasMatch(password);

    if (!emailInvalid && !passwordInvalid) {
      emit(state.copyWith(
        isEmailInvalid: false,
        isPasswordInvalid: false,
        loginSuccess: true,
      ));
    } else {
      emit(state.copyWith(
        isEmailInvalid: emailInvalid,
        isPasswordInvalid: passwordInvalid,
        loginSuccess: false,
      ));
    }
  }

  void resetSuccess() {
    emit(state.copyWith(loginSuccess: false));
  }
}
