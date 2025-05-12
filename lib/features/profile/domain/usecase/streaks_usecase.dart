import 'package:express_testing/features/profile/domain/repository/profile_repo.dart';
import '../entity/streak_response_entity.dart';

class GetStreaksUseCase {
  final ProfileRepo repository;

  GetStreaksUseCase(this.repository);

  Future<StreakResponseEntity> call() async {
    return await repository.getStreaks();
  }
}
