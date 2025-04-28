class SignUpRequestModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;

  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
        'gender': gender,
      };
}
