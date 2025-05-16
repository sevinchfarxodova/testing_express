import '../../../auth/domain/entity/network_response.dart';
import '../repository/home_repo.dart';

class GetTaskListUseCase {
  final HomeRepo homeRepo;

  GetTaskListUseCase(this.homeRepo);

  Future<NetworkResponse> fetchTaskList() async =>
      await homeRepo.fetchTaskList();
}
