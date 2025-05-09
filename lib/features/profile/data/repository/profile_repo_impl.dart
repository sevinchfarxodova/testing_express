import 'dart:io';
import 'package:express_testing/features/profile/data/data_source/profile_data_source.dart';
import '../../../../core/global/models/network_response.dart';
import '../../domain/repository/profile_repo.dart';
import '../model/profile_model.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;
  ProfileRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<NetworkResponse> updateUser({
    required ProfileModel profileModel,
  }) async {
    return await remoteDataSource.updateUser(profileModel: profileModel);
  }

  @override
  Future<NetworkResponse> deleteUser() async {
    return await remoteDataSource.deleteUser();
  }

  @override
  Future<NetworkResponse> logOut() async {
    return await remoteDataSource.logOut();
  }

  @override
  Future<NetworkResponse> payment() async {
    return await remoteDataSource.payment();
  }

  @override
  Future<NetworkResponse> fetchUser() async {
    return await remoteDataSource.fetchUser();
  }

  @override
  Future<NetworkResponse> uploadFile({required File file}) async {
    return await remoteDataSource.uploadFile(file: file);
  }
}
