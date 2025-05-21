import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:express_testing/core/dio_client/api_urls.dart';
import 'package:express_testing/core/exceptions/my_dio_error.dart';

import '../../../../core/dio_client/api_service.dart';
import '../../../auth/domain/entity/network_response.dart';
import '../models/tasks_model.dart';

class HomeSource {
  final DioClient _dioClient;

  HomeSource(this._dioClient);

  Future<DailyTaskModel> getTasks(String userId) async {
    try {
      final response = await _dioClient.get(
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

  Future<DailyTaskModel> fetchTaskList() async {
    try {
      final response = await _dioClient.get(ApiUrls.getTaskList);

      log("✅ fetchTaskList data: ${response.data}");
      log("📦 fetchTaskList status code: ${response.statusCode}");

      return DailyTaskModel.fromJson(response.data);
    } on DioException catch (error) {
      log(
        "❌ DioException in fetchTaskList: ${error.response?.statusCode} - ${error.response?.statusMessage}",
      );
      log(
        "❌ Message: ${error.response?.data["message"] ?? error.checkError()}",
      );
      throw Exception("Failed to fetch tasks: ${error.message}");
    } catch (e) {
      log("❌ Unknown Error in fetchTaskList: $e");
      rethrow;
    }
  }
}
