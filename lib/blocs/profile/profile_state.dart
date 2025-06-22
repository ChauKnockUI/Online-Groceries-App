class ProfileState {
  final String? name;
  final String? email;
  final bool isLoading;
  final String? error;

  ProfileState({
    this.name,
    this.email,
    this.isLoading = false,
    this.error,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    bool? isLoading,
    String? error,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}