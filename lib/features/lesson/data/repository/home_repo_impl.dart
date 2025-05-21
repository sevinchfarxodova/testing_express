import 'package:express_testing/features/auth/domain/entity/network_response.dart';

import '../../domain/entity/tasks_entity.dart';
import '../../domain/repository/home_repo.dart';
import '../datasource/home_datasource.dart';

class HomeRepoImpl extends HomeRepo {
  HomeSource homeSource;

  HomeRepoImpl(this.homeSource);

  @override
  Future<DailyTaskEntity> getTasks(String userId) async {
    return await homeSource.getTasks(userId);
  }

  @override
  Future<DailyTaskEntity> fetchTaskList() async {
    final model = await homeSource.fetchTaskList();

    final entity = DailyTaskEntity(
      count: model.count,
      dailyTasks: model.dailyTasks,
      dailyTasksProgress: model.dailyTasksProgress,
    );
    return entity;
  }
}
