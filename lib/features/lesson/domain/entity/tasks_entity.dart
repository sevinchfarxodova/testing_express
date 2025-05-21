class DailyTaskEntity {
  final int count;
  final List<DailyTask> dailyTasks;
  final DailyTaskProgress dailyTasksProgress;

  const DailyTaskEntity({
    required this.count,
    required this.dailyTasks,
    required this.dailyTasksProgress,
  });
}

class DailyTask {
  final int day;
  final String id;
  final List<String> lessons;
  final String subscription;
  final int tests;
  final List<String> videoLessons;

  const DailyTask({
    required this.day,
    required this.id,
    required this.lessons,
    required this.subscription,
    required this.tests,
    required this.videoLessons,
  });
}

class DailyTaskProgress {
  final int completedTests;
  final String dailyTaskId;
  final String id;
  final bool isDone;
  final Map<String, bool> lessons;
  final int tests;
  final String userId;
  final Map<String, bool> videoLessons;

  const DailyTaskProgress({
    required this.completedTests,
    required this.dailyTaskId,
    required this.id,
    required this.isDone,
    required this.lessons,
    required this.tests,
    required this.userId,
    required this.videoLessons,
  });
}
