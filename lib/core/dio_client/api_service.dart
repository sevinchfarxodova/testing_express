import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:express_testing/core/dio_client/interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../local_source/storage_repository.dart';

class ApiClient {
  ApiClient() {
    init();
  }

  late Dio dio;
  late Dio secureDio;

  void init() {
    dio = Dio(

      BaseOptions(
        baseUrl: 'https://express.axadjonovsardorbek.uz/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        responseType: ResponseType.json,
        sendTimeout: const Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
        },

      ),
    );

    dio.interceptors.addAll([
      LoggerInterceptor(),
      PrettyDioLogger(
        compact: false,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: (object) => log(object.toString(), name: 'EXPRESS API'),
      ),
    ]

    );

    secureDio = Dio(
      BaseOptions(
        baseUrl: 'https://express.axadjonovsardorbek.uz/',
        // Base URL qo‘shildi
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          'Authorization': StorageRepository.getString(key: "access_token"),
          'Content-Type': 'application/json',
        },
      ),
    );

    secureDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // log('🔵 So‘rov: [${options.method}] ${options.uri}');
          // if (options.data != null) {
          //   log('📤 So‘rov maʼlumotlari: ${options.data}');
          // }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // log('✅ Javob: ${response.statusCode} - ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          log('❌ Xatolik: ${error.response?.statusCode ?? ''} - ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }
}
