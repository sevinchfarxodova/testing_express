import 'package:dio/dio.dart';

extension MyErrorDio on DioException {
  String checkError() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return "Ulanish vaqti tugadi";

      case DioExceptionType.sendTimeout:
        return "Ma'lumot jo'natish vaqti tugadi";

      case DioExceptionType.receiveTimeout:
        return "Ma'lumot olish vaqti tugadi";

      case DioExceptionType.cancel:
        return "So'rov bekor qilindi";

      case DioExceptionType.connectionError:
        return "Ulanish xatosi yuz berdi";

      case DioExceptionType.unknown:
        return "Noma'lum xato";

      default:
        return "Xato yuz berdi";
    }
  }
}
