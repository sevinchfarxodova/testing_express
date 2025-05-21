import '../../domain/entity/tasks_entity.dart';

class DailyTaskModel extends DailyTaskEntity {
  const DailyTaskModel({
    required super.count,
    required List<DailyTaskItemModel> super.dailyTasks,
    required DailyTaskProgressModel super.dailyTasksProgress,
  });

  factory DailyTaskModel.fromJson(Map<String, dynamic> json) {
    return DailyTaskModel(
      count: json['count'],
      dailyTasks:
          (json['dailyTasks'] as List)
              .map((e) => DailyTaskItemModel.fromJson(e))
              .toList(),
      dailyTasksProgress: DailyTaskProgressModel.fromJson(
        json['dailyTasksProgress'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'dailyTasks':
          dailyTasks.map((e) => (e as DailyTaskItemModel).toJson()).toList(),
      'dailyTasksProgress':
          (dailyTasksProgress as DailyTaskProgressModel).toJson(),
    };
  }
}

class DailyTaskItemModel extends DailyTask {
  const DailyTaskItemModel({
    required super.day,
    required super.id,
    required super.lessons,
    required super.subscription,
    required super.tests,
    required super.videoLessons,
  });

  factory DailyTaskItemModel.fromJson(Map<String, dynamic> json) {
    return DailyTaskItemModel(
      day: json['day'],
      id: json['id'],
      lessons: List<String>.from(json['lessons']),
      subscription: json['subscription'],
      tests: json['tests'],
      videoLessons: List<String>.from(json['videoLessons']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'id': id,
      'lessons': lessons,
      'subscription': subscription,
      'tests': tests,
      'videoLessons': videoLessons,
    };
  }
}

class DailyTaskProgressModel extends DailyTaskProgress {
  const DailyTaskProgressModel({
    required super.completedTests,
    required super.dailyTaskId,
    required super.id,
    required super.isDone,
    required super.lessons,
    required super.tests,
    required super.userId,
    required super.videoLessons,
  });

  factory DailyTaskProgressModel.fromJson(Map<String, dynamic> json) {
    return DailyTaskProgressModel(
      completedTests: json['completedTests'],
      dailyTaskId: json['dailyTaskId'],
      id: json['id'],
      isDone: json['isDone'],
      lessons: Map<String, bool>.from(json['lessons']),
      tests: json['tests'],
      userId: json['userId'],
      videoLessons: Map<String, bool>.from(json['videoLessons']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'completedTests': completedTests,
      'dailyTaskId': dailyTaskId,
      'id': id,
      'isDone': isDone,
      'lessons': lessons,
      'tests': tests,
      'userId': userId,
      'videoLessons': videoLessons,
    };
  }
}
