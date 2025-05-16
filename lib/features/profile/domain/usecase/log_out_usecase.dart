import '../../../../core/global/models/network_response.dart';
import '../repository/profile_repo.dart';

class LogOutUseCase {
  final ProfileRepo repo;

  LogOutUseCase(this.repo);

  Future<NetworkResponse> call() {
    return repo.logOut();
  }
}
