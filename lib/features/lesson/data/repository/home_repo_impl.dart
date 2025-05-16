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
  Future<NetworkResponse> fetchTaskList() async {
    return await homeSource.fetchTaskList();
  }
}
