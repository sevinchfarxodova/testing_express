import 'streak_entity.dart';

class StreakResponseEntity {
  final int count;
  final List<StreakEntity> streaks;

  StreakResponseEntity({
    required this.count,
    required this.streaks,
  });
}
