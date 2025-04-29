import 'history_model.dart';

class UserProfileModel {
  final String name;
  final String email;
  final List<HistoryModel> history;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.history,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      email: json['email'],
      history: (json['history'] as List)
          .map((e) => HistoryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'history': history.map((e) => e.toJson()).toList(),
    };
  }
}
