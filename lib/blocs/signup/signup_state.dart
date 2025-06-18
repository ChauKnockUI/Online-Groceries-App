class SignUpState {
  final bool isEmailInvalid;
  final bool isPasswordInvalid;
  final bool signUpSuccess;
  final bool isSignUpButtonEnabled;
  final bool isLoading;

  SignUpState({
    this.isEmailInvalid = false,
    this.isPasswordInvalid = false,
    this.signUpSuccess = false,
    this.isSignUpButtonEnabled = false,
    this.isLoading = false,
  });

  factory SignUpState.initial() {
    return SignUpState();
  }

  SignUpState copyWith({
    bool? isEmailInvalid,
    bool? isPasswordInvalid,
    bool? signUpSuccess,
    bool? isSignUpButtonEnabled,
    bool? isLoading,
  }) {
    return SignUpState(
      isEmailInvalid: isEmailInvalid ?? this.isEmailInvalid,
      isPasswordInvalid: isPasswordInvalid ?? this.isPasswordInvalid,
      signUpSuccess: signUpSuccess ?? this.signUpSuccess,
      isSignUpButtonEnabled: isSignUpButtonEnabled ?? this.isSignUpButtonEnabled,
      isLoading: isLoading ?? this.isLoading,
    );
  }
} 