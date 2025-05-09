import '../../../../core/global/models/network_response.dart';
import '../repository/profile_repo.dart';

class PaymentUseCase {
  final ProfileRepo repo;

  PaymentUseCase(this.repo);

  Future<NetworkResponse> call() {
    return repo.payment();
  }
}
