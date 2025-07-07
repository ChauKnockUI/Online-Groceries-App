class RegisterRequest {
  final String username;
  final String email;
  final String password;
  final String lastname;
  final String firstname;

  RegisterRequest({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstname,
      'lastName': lastname,
      'email': email,
      'password': password,
    };
  }
}
