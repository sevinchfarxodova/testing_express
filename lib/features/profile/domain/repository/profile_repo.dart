import 'dart:io';
import 'package:express_testing/features/profile/data/model/profile_model.dart';
import '../../../../core/global/models/network_response.dart';

abstract class ProfileRepo {
  Future<NetworkResponse> updateUser({required ProfileModel profileModel});

  Future<NetworkResponse> deleteUser();

  Future<NetworkResponse> logOut();

  Future<NetworkResponse> payment();

  Future<NetworkResponse> fetchUser();

  Future<NetworkResponse> uploadFile({required File file});
}
