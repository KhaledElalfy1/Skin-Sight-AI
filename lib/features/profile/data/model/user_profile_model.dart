import 'history_model.dart';

class UserProfileModel {
  final String name;
  final String email;
  final String gender;
  final List<HistoryModel> history;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.history,
    required this.gender,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      history: (json['history'] as List)
          .map((e) => HistoryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'history': history.map((e) => e.toJson()).toList(),
    };
  }
}
