class SignUpRequestModel {
  final String name;
  final String email;
  final String password;
  final String mobile;
  final String countryCode;

  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.mobile,
    required this.countryCode, required String username,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'mobile': mobile,
      'country_code': countryCode,
    };
  }
}
