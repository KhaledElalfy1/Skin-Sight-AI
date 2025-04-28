class HistoryModel {
  final DateTime date;
  final String diagnosis;

  HistoryModel({
    required this.date,
    required this.diagnosis,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      date: DateTime.parse(json['date']),
      diagnosis: json['diagnosis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'diagnosis': diagnosis,
    };
  }
}
