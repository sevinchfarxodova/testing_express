


import '../entity/tasks_entity.dart';
import '../repository/home_repo.dart';

class FetchDailyTasksUseCase {
  final HomeRepo homeRepo;

  FetchDailyTasksUseCase(this.homeRepo);

  Future<DailyTaskEntity> call(String userId) async {
    return await homeRepo.getTasks(userId);
  }


}
