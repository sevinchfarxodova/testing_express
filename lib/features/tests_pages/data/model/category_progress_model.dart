import '../../domain/entity/category_progress_entity.dart';

class CategoryProgressModel extends CategoryProgressEntity {
  CategoryProgressModel({
    required super.categoryId,
    required super.incorrectAttempts,
    required super.totalAttempts,
  });

  factory CategoryProgressModel.fromJson(Map<String, dynamic> json) {
    return CategoryProgressModel(
      categoryId: json['category_id'],
      incorrectAttempts: json['incorrect_attempts'],
      totalAttempts: json['total_attempts'],
    );
  }
}