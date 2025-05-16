import '../../../auth/domain/entity/network_response.dart';
import '../entity/tasks_entity.dart';

abstract class HomeRepo {
  Future<DailyTaskEntity> getTasks(String userId);

  Future<NetworkResponse> fetchTaskList();

  // Future<NetworkResponse> updateDailyTaskProgress({
  //   required String taskId,
  //   required Map<String, bool> lessons,
  //   required Map<String, bool> videoLessons,
  //   required int completedTests,
  //   required bool isDone,
  // });
  //
  // Future<NetworkResponse> markTaskAsDone(String taskId);
}
