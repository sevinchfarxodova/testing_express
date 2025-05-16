import '../../../../core/global/models/network_response.dart';
import '../../data/model/profile_model.dart';
import '../repository/profile_repo.dart';

class UpdateUserUseCase {
  final ProfileRepo profileRepo;

  UpdateUserUseCase(this.profileRepo);

  Future<NetworkResponse> call(ProfileModel profileModel) async {
    return await profileRepo.updateUser(profileModel: profileModel);
  }
}
