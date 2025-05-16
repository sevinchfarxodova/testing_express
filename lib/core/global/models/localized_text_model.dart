class LocalizedTextModel {
  final Map<String, String> values;

  LocalizedTextModel({required this.values});

  factory LocalizedTextModel.fromJson(Map<String, dynamic> json) {
    return LocalizedTextModel(values: Map<String, String>.from(json));
  }

  Map<String, dynamic> toJson() => values;
}
