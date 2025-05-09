import '../../../../core/global/models/network_response.dart';
import '../repository/profile_repo.dart';

class FetchUserUseCase {
  final ProfileRepo repo;

  FetchUserUseCase(this.repo);

  Future<NetworkResponse> call() {
    return repo.fetchUser();
  }
}
