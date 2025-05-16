import 'package:express_testing/features/tests_pages/domain/repository/test_repo.dart';
import '../../domain/entity/test_response_entity.dart';
import '../datasources/test_data_source.dart';

class TestRepoImpl extends TestRepository {
  final TestRemoteDataSource remoteDataSource;

  TestRepoImpl({required this.remoteDataSource});

  @override
  Future<TestResponseEntity> getTests({
    required int limit,
    required int offset,
    String? categoryId,
    String? search,
  }) async {
  return  await  remoteDataSource.getTests(
      limit: limit,
      offset: offset,
      categoryId: categoryId,
      search: search,
    );
  }

  @override
  Future<void> incrementIncorrectAttempts({required String categoryId}) {
    // TODO: implement incrementIncorrectAttempts
    throw UnimplementedError();
  }

  @override
  Future<void> saveProgress({required int countTrueAnswer, required int lengthTest}) {
    // TODO: implement saveProgress
    throw UnimplementedError();
  }
}
