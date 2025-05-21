import 'package:express_testing/features/lesson/domain/entity/tasks_entity.dart';

import '../repository/home_repo.dart';

class GetTaskListUseCase {
  final HomeRepo homeRepo;

  GetTaskListUseCase(this.homeRepo);

  Future<DailyTaskEntity> fetchTaskList() async =>
      await homeRepo.fetchTaskList();
}
