import 'package:express_testing/features/tests_pages/data/model/category_progress_model.dart';
import 'package:express_testing/features/tests_pages/data/model/test_model.dart';

import '../../domain/entity/test_response_entity.dart';

class TestResponseModel extends TestResponseEntity {
  TestResponseModel({
    required super.count,
    required List<CategoryProgressModel> super.progress,
    required List<TestModel> super.tests,
  });

  factory TestResponseModel.fromJson(Map<String, dynamic> json) {
    return TestResponseModel(
      count: json['count'],
      progress: (json['progress'] as List)
          .map((e) => CategoryProgressModel.fromJson(e))
          .toList(),
      tests: (json['tests'] as List)
          .map((e) => TestModel.fromJson(e))
          .toList(),
    );
  }
}