class DiagnosisModel {
  final List<String> diagnosis;

  DiagnosisModel({required this.diagnosis});

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisModel(
      diagnosis: (json['class_name'] as List).cast<String>(),
    );
  }
}
