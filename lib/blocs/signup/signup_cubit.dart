import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initial());

  void signUp(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    bool emailInvalid = !(email.contains('@'));
    bool passwordInvalid = password.length < 6;

    if (!emailInvalid && !passwordInvalid) {
      emit(state.copyWith(signUpSuccess: true, isLoading: false));
    } else {
      emit(state.copyWith(
        isEmailInvalid: emailInvalid,
        isPasswordInvalid: passwordInvalid,
        signUpSuccess: false,
        isLoading: false,
      ));
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
    emit(state.copyWith(
      isEmailInvalid: !isEmailValid,
      isPasswordInvalid:  !isPasswordValid,
      isSignUpButtonEnabled: isEmailValid && isPasswordValid,
    ));
  }
} 