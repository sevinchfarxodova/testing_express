import '../../domain/entity/streak_response_entity.dart';
import 'streak_model.dart';


class StreakResponseModel {
  final int count;
  final List<StreakModel> streaks;

  StreakResponseModel({
    required this.count,
    required this.streaks,
  });

  factory StreakResponseModel.fromJson(Map<String, dynamic> json) {
    return StreakResponseModel(
      count: json['count'] as int,
      streaks: (json['streaks'] as List)
          .map((e) => StreakModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'streaks': streaks.map((e) => e.toJson()).toList(),
    };
  }

  StreakResponseEntity toEntity() {
    return StreakResponseEntity(
      count: count,
      streaks: streaks.map((e) => e.toEntity()).toList(),
    );
  }
}
