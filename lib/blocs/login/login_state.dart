class LoginState {
  final bool isEmailInvalid;
  final bool isPasswordInvalid;
  final bool loginSuccess;

  LoginState({
    this.isEmailInvalid = false,
    this.isPasswordInvalid = false,
    this.loginSuccess = false,
  });

  factory LoginState.initial() {
    return LoginState(
      isEmailInvalid: false,
      isPasswordInvalid: false,
      loginSuccess: false,
    );
  }

  LoginState copyWith({
    bool? isEmailInvalid,
    bool? isPasswordInvalid,
    bool? loginSuccess,
  }) {
    return LoginState(
      isEmailInvalid: isEmailInvalid ?? this.isEmailInvalid,
      isPasswordInvalid: isPasswordInvalid ?? this.isPasswordInvalid,
      loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }
}
