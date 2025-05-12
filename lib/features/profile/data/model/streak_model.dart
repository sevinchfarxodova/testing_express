
import '../../domain/entity/streak_entity.dart';

class StreakModel {
  final String id;
  final String date;
  final String completedAt;
  final bool isCompleted;
  final String userId;
  final String userName;
  final String userPhone;

  StreakModel({
    required this.id,
    required this.date,
    required this.completedAt,
    required this.isCompleted,
    required this.userId,
    required this.userName,
    required this.userPhone,
  });

  factory StreakModel.fromJson(Map<String, dynamic> json) {
    return StreakModel(
      id: json['id'] as String,
      date: json['date'] as String,
      completedAt: json['completed_at'] as String,
      isCompleted: json['is_completed'] as bool,
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      userPhone: json['user_phone'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'completed_at': completedAt,
      'is_completed': isCompleted,
      'user_id': userId,
      'user_name': userName,
      'user_phone': userPhone,
    };
  }

  StreakEntity toEntity() {
    return StreakEntity(
      id: id,
      date: date,
      completedAt: completedAt,
      isCompleted: isCompleted,
      userId: userId,
      userName: userName,
      userPhone: userPhone,
    );
  }
}
