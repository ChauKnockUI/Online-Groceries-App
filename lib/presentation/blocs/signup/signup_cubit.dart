import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';
import 'package:training_project/domain/usecases/sign_up_user.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUser signUpUser;
  SignUpCubit(this.signUpUser) : super(SignUpState.initial());

  Future<void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await signUpUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      emit(state.copyWith(signUpSuccess: true, isLoading: false));
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
