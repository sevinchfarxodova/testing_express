import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_urls.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseURL,
        connectTimeout:  Duration(seconds: 20),
        receiveTimeout:  Duration(seconds: 20),
        responseType: ResponseType.json,
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        },
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        compact: false,
        logPrint: (object) => log(object.toString(), name: 'TMDB API'),
      ),
    );
  }

  void setToken(String token){
    _dio.options.headers["Authorization"]="Bearer $token";
  }

  // GET
  Future<Response<dynamic>> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      log('Response Data: ${response.data}');
      return response;
    } on DioException {
      rethrow;
    }
  }

  // PATCH
  Future<Response<dynamic>> patch(
      String uri, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // POST
  Future<Response<dynamic>> post(
      String uri, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.post(
        uri,
        queryParameters: queryParameters,
        options: options,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // PUT
  Future<Response<dynamic>> put(
      String uri, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // DELETE
  Future<Response<dynamic>> delete(
      String uri, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      final response = _dio.delete(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}
