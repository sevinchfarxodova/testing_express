import '../entity/test_response_entity.dart';
import '../repository/test_repo.dart';

class GetTestsUseCase {
  final TestRepository repository;

  GetTestsUseCase({required this.repository});

  Future<TestResponseEntity> call({
    required int limit,
    required int offset,
    String? categoryId,
    String? search,
  }) {
    return repository.getTests(
      limit: limit,
      offset: offset,
      categoryId: categoryId,
      search: search,
    );
  }
}
