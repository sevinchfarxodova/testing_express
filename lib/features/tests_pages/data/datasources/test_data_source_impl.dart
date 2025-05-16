import 'package:dio/dio.dart';
import 'package:express_testing/features/tests_pages/data/datasources/test_data_source.dart';
import '../../../../core/dio_client/api_service.dart';
import '../../../../core/dio_client/api_urls.dart';
import '../model/test_response_model.dart';

class TestRemoteDataSourceImpl extends TestRemoteDataSource {
  final DioClient dioClient;

  TestRemoteDataSourceImpl({required this.dioClient});

  // test
  @override
  Future<TestResponseModel> getTests({
    required int limit,
    required int offset,
    String? categoryId,
    String? search,
  }) async {
    try {
      final response = await dioClient.get(
        ApiUrls.getTest,
        queryParameters: {
          "limit": limit,
          "offset": offset,
          if (categoryId != null) "category_id": categoryId,
          if (search != null) "search": search,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TestResponseModel.fromJson(response.data);
      } else {
        print("success");
        throw Exception("Error: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error eee: ${e.message}");
    }
  }
}
