import '../../domain/entity/test_entity.dart';

class TestModel extends TestEntity {
  TestModel({
    required super.answers,
    required super.category,
    required super.categoryId,
    required super.correctAnswer,
    required super.description,
    required super.id,
    required super.mediaUrl,
    required super.title,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      answers: Map<String, List<String>>.from(
        json['answers'].map((k, v) => MapEntry(k, List<String>.from(v))),
      ),
      category: Map<String, String>.from(json['category']),
      categoryId: json['category_id'],
      correctAnswer: Map<String, String>.from(json['correct_answer']),
      description: Map<String, String>.from(json['description']),
      id: json['id'],
      mediaUrl: json['media_url'],
      title: Map<String, String>.from(json['title']),
    );
  }
}