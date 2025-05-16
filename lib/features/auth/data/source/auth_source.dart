import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:express_testing/core/dio_client/api_urls.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/dio_client/api_service.dart';
import '../../../../core/local_source/storage_repository.dart';
import '../../../../service_locator.dart';
import '../../domain/entity/network_response.dart';

class AuthSource {
  final ApiClient _apiClient;

  AuthSource(this._apiClient);

  Future<NetworkResponse> sendSms(String phoneNumber) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final response = await _apiClient.dio.post(
        ApiUrls.sendSms,
        data: {"phone": phoneNumber},
      );
      if (!(response.statusCode! >= 200 && response.statusCode! < 300)) {
        log(
          "Error Bad status code  in send sms: ${response.statusCode} ---------",
        );
        networkResponse.errorText =
            "Error Bad status code  in send sms: ${response.statusCode} ------";
      }
    } on DioException catch (error) {
      log(
        "Error DioException  in send sms: ${error.response?.statusCode}  ${error.response?.statusMessage}-----",
      );

      final statusCode = error.response?.statusCode;
      final errorMessage = error.response?.data["message"];

      log(
        "❌ DioException in sendSms — Status: $statusCode, Message: $errorMessage",
      );

      if (statusCode == 409) {
        networkResponse.errorText =
            errorMessage ??
            "Ushbu telefon raqami bilan allaqachon so‘rov yuborilgan.";
      } else {
        networkResponse.errorText =
            errorMessage ?? "SMS yuborishda xatolik yuz berdi.";
      }
    } catch (e) {
      networkResponse.errorText =
          "Error catch (e, stack) in send sms: $e ------";
    }
    return networkResponse;
  }

  Future<NetworkResponse> confirm({
    required String phoneNumber,
    required String verificationCode,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final response = await _apiClient.dio.post(
        ApiUrls.login,
        data: {"phone": phoneNumber, "confirmation_code": verificationCode},
      );

      debugPrint("Data sendMessage: ${response.data} ---------");

      if ((response.statusCode! >= 200 && response.statusCode! < 300)) {
        await StorageRepository.setString(
          key: "access_token",
          value: response.data["access_token"],
        );
        await StorageRepository.setString(
          key: "refresh_token",
          value: response.data["refresh_token"],
        );
        await StorageRepository.setString(
          key: "user_id",
          value: response.data["id"],
        );

        sl<ApiClient>().init();
      } else {
        log(
          "Error Bad status code  in login: ${response.statusCode} ---------",
        );
        networkResponse.errorText =
            "Error Bad status code  in login: ${response.statusCode} ------";
      }
    } on DioException catch (error) {
      log(
        "Error DioException  in login: ${error.response?.statusCode}  ${error.response?.statusMessage}-----",
      );

      // networkResponse.errorText =
      //     error.response?.data["message"].toString() ?? "Kiritilgan kod noto‘g‘ri!";
    } catch (e) {
      networkResponse.errorText = "Error catch (e, stack) in login: $e ------";
    }
    return networkResponse;
  }
}
