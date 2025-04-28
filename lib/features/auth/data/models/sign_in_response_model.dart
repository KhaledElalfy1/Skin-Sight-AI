import 'package:skin_sight_ai/core/database/api/end_points.dart';

class SignInResponseModel {
  final String message;
  final String token;
  final String email;
  final String name;
  final bool isAuthenticated;
  final String expiresOn;

  SignInResponseModel({
    required this.message,
    required this.token,
    required this.email,
    required this.name,
    required this.isAuthenticated,
    required this.expiresOn,
  });
  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      message: json[ApiKeys.message] ?? '',
      token: json[ApiKeys.token] ?? '',
      email: json[ApiKeys.email] ?? '',
      name: json[ApiKeys.name] ?? '',
      isAuthenticated: json[ApiKeys.isAuthenticated] ?? false,
      expiresOn: json[ApiKeys.expiresOn] ?? '',
    );
  }
}
