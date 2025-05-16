import '../entity/test_response_entity.dart';

abstract class TestRepository {

  Future<TestResponseEntity> getTests({
    required int limit,
    required int offset,
    String? categoryId,
    String? search,
  });

  Future<void> incrementIncorrectAttempts({required String categoryId});

  Future<void> saveProgress({
    required int countTrueAnswer,
    required int lengthTest,
  });
}