import 'package:express_testing/features/tests_pages/domain/entity/test_entity.dart';
import 'category_progress_entity.dart';

class TestResponseEntity {
  final int count;
  final List<CategoryProgressEntity> progress;
  final List<TestEntity> tests;

  TestResponseEntity({
    required this.count,
    required this.progress,
    required this.tests,
  });
}