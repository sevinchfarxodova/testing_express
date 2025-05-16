import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:express_testing/core/dio_client/api_urls.dart';
import 'package:express_testing/core/extension/my_dio_exception.dart';

import '../../../../core/dio_client/api_service.dart';
import '../../../auth/domain/entity/network_response.dart';
import '../models/tasks_model.dart';

class HomeSource {
  final ApiClient _apiClient;

  HomeSource(this._apiClient);

  Future<DailyTaskModel> getTasks(String userId) async {
    try {
      final response = await _apiClient.dio.get(
        ApiUrls.getLesson,
        // queryParameters: {
        //   "user_id": userId,
        // },
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return DailyTaskModel.fromJson(response.data);
      } else {
        throw Exception("Xatolik yuz berdi. Kod: ${response.statusCode}");
      }
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode;
      final errorMessage =
          error.response?.data["message"] ?? "Serverda xatolik yuz berdi.";
      throw Exception("Dio error [$statusCode]: $errorMessage");
    } catch (e) {
      throw Exception("Noma'lum xatolik yuz berdi: $e");
    }
  }

  Future<NetworkResponse> fetchTaskList() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final response = await _apiClient.dio.get(ApiUrls.getTaskList); //???

      log("fetchTaskList data: ${response.data}");
      log("fetchTaskList status code: ${response.statusCode}");

      if ((response.statusCode! >= 200 && response.statusCode! < 300)) {
        networkResponse.data = DailyTaskModel.fromJson(response.data);
      } else {
        networkResponse.errorText =
            "Error Bad status code in fetchTaskList: ${response.statusCode} ------";
      }
    } on DioException catch (error) {
      log(
        "Error DioException  in fetchTaskList: ${error.response?.statusCode}  ${error.response?.statusMessage}-----",
      );

      networkResponse.errorText =
          error.response?.data["message"] ?? error.checkError();
    } catch (e) {
      networkResponse.errorText =
          "Error catch (e, stack) in fetchTaskList: $e ------";
    }

    return networkResponse;
  }
}
