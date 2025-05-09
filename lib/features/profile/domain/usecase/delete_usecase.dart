import '../../../../core/global/models/network_response.dart';
import '../repository/profile_repo.dart';

class DeleteUserUseCase {
  final ProfileRepo repo;

  DeleteUserUseCase(this.repo);

  Future<NetworkResponse> call() {
    return repo.deleteUser();
  }
}
