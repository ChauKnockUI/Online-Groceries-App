class LoginResponse {
  final String accessToken;
  final String refreshToken;

  LoginResponse({required this.accessToken, required this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['data']['meta']['accessToken'],
      refreshToken: json['data']['meta']['refreshToken'],
    );
  }
}
