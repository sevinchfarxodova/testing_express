class StreakEntity {
  final String id;
  final String date;
  final String completedAt;
  final bool isCompleted;
  final String userId;
  final String userName;
  final String userPhone;

  StreakEntity({
    required this.id,
    required this.date,
    required this.completedAt,
    required this.isCompleted,
    required this.userId,
    required this.userName,
    required this.userPhone,
  });
}
