import 'dart:io';
import '../../../../core/global/models/network_response.dart';
import '../model/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<NetworkResponse> updateUser({required ProfileModel profileModel});

  Future<NetworkResponse> deleteUser();

  Future<NetworkResponse> logOut();

  Future<NetworkResponse> payment();

  Future<NetworkResponse> fetchUser();

  Future<NetworkResponse> uploadFile({required File file});
}
