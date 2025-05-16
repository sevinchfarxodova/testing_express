import '../repository/test_repo.dart';

class ProgressCreateUseCase {
  final TestRepository repository;

  ProgressCreateUseCase({required this.repository});

  Future<void> call({
    required int countTrueAnswer,
    required int lengthTest,
  }) {
    return repository.saveProgress(countTrueAnswer: countTrueAnswer, lengthTest: lengthTest);
  }
}