class LoginState {
  final bool isEmailInvalid;
  final bool isPasswordInvalid;
  final bool loginSuccess;
  final bool isLoginButtonEnabled;

  LoginState({
    this.isEmailInvalid = false,
    this.isPasswordInvalid = false,
    this.loginSuccess = false,
    this.isLoginButtonEnabled = false,
  });

  factory LoginState.initial() {
    return LoginState(
      isEmailInvalid: false,
      isPasswordInvalid: false,
      loginSuccess: false,
      isLoginButtonEnabled: false,
    );
  }

  LoginState copyWith({
    bool? isEmailInvalid,
    bool? isPasswordInvalid,
    bool? loginSuccess,
    bool? isLoginButtonEnabled,
  }) {
    return LoginState(
      isEmailInvalid: isEmailInvalid ?? this.isEmailInvalid,
      isPasswordInvalid: isPasswordInvalid ?? this.isPasswordInvalid,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
    );
  }
}
