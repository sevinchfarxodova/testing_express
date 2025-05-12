import 'dart:io';
import 'package:dio/dio.dart';
import 'package:express_testing/core/dio_client/api_service.dart';
import 'package:express_testing/core/global/models/network_response.dart';
import 'package:express_testing/features/profile/data/data_source/profile_data_source.dart';
import 'package:express_testing/features/profile/data/model/profile_model.dart';
import 'package:express_testing/features/profile/data/model/streak_response_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/dio_client/api_urls.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient dioClient;

  ProfileRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<NetworkResponse> deleteUser() async {
    try {
      final response = await dioClient.delete(ApiUrls.deleteProfile);
      debugPrint("deleteUser ${response.data}  ---------");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse();
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<NetworkResponse> fetchUser() async {
    try {
      final response = await dioClient.get(ApiUrls.getProfile);
      debugPrint("fetchUser ${response.data}  ---------");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse();
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<NetworkResponse> uploadFile({required File file}) async {
    String imageName = file.path
        .split('/')
        .last;

    debugPrint("Image name: $imageName ------");

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: imageName),
      });
      final response = await dioClient.post(
        ApiUrls.uploadFile,
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse();
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<NetworkResponse> updateUser({
    required ProfileModel profileModel,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      final response = await dioClient.put(
        ApiUrls.updateProfile,
        data: profileModel.toJson(),
      );
      debugPrint("updateUser ${response.data}  ---------");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return networkResponse;
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<NetworkResponse> payment() {
    throw UnimplementedError();
  }

  Future<NetworkResponse> logOut() async {
    NetworkResponse networkResponse = NetworkResponse();

    return networkResponse;
  }


  @override
  Future<StreakResponseModel> getStreaks()async {
    try {
      final response = await dioClient.get(
          ApiUrls.streakList);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return StreakResponseModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  String _parseError(Response response) {
    try {
      final errorJson = response.data;
      return errorJson['message'] ?? 'Unknown error occurred';
    } catch (_) {
      return 'Server error: ${response.statusCode}';
    }
  }

  String _parseDioError(DioException e) {
    if (e.response != null && e.response!.data != null) {
      try {
        final errorJson = e.response!.data;
        return errorJson['message'] ?? 'Unknown error occurred';
      } catch (_) {
        return 'Server error: ${e.response?.statusCode}';
      }
    }
    return e.message ?? 'Network error occurred';


  }


}