import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/domain/usecases/login_user.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;

  LoginCubit(this.loginUser) : super(LoginState.initial());

  Future<void> login(String email, String password) async {
    final isEmailValid = email.length > 11 && email.endsWith('mail.com');
    final isPasswordValid = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$').hasMatch(password);
    if (!isEmailValid || !isPasswordValid) return;
    emit(state.copyWith(isLoading: true));
    try {
      final user = await loginUser(email, password);
      // TODO: Lưu token nếu cần, hoặc xử lý user
      emit(state.copyWith(loginSuccess: true, isLoading: false));
    } catch (e) {
      emit(state.copyWith(loginSuccess: false, isLoading: false));
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
