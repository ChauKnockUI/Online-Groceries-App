class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  final Map<String, dynamic> userInfo;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userInfo,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['data']['meta']['accessToken'],
      refreshToken: json['data']['meta']['refreshToken'],
      userInfo: json['data']['userInfo'],
    );
  }
}