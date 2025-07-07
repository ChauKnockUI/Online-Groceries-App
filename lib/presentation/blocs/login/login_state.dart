class LoginState {
  final bool isEmailInvalid;
  final bool isPasswordInvalid;
  final bool loginSuccess;
  final bool isLoginButtonEnabled;
  final bool isLoading;
  final bool showPassword;

  LoginState({
    this.isEmailInvalid = false,
    this.isPasswordInvalid = false,
    this.loginSuccess = false,
    this.isLoginButtonEnabled = false,
    this.isLoading = false,
    this.showPassword = false,
  });

  factory LoginState.initial() {
    return LoginState(
      isEmailInvalid: false,
      isPasswordInvalid: false,
      loginSuccess: false,
      isLoginButtonEnabled: false,
      isLoading: false,
      showPassword: false,
    );
  }

  LoginState copyWith({
    bool? isEmailInvalid,
    bool? isPasswordInvalid,
    bool? loginSuccess,
    bool? isLoginButtonEnabled,
    bool? isLoading,
    bool? showPassword,
  }) {
    return LoginState(
      isEmailInvalid: isEmailInvalid ?? this.isEmailInvalid,
      isPasswordInvalid: isPasswordInvalid ?? this.isPasswordInvalid,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
      isLoading: isLoading ?? this.isLoading,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
