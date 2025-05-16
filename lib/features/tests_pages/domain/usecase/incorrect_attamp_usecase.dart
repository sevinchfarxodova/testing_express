import '../repository/test_repo.dart';

class IncorrectAttemptsAddCountUseCase {
  final TestRepository repository;

  IncorrectAttemptsAddCountUseCase({required this.repository});

  Future<void> call({required String categoryId}) {
    return repository.incrementIncorrectAttempts( categoryId: categoryId);
  }
}