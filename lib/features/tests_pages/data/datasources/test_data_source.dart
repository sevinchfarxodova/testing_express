import '../model/test_response_model.dart';

abstract class TestRemoteDataSource {

  Future<TestResponseModel> getTests({
    required int limit,
    required int offset,
    String? categoryId,
    String? search,
  });

}
