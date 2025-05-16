class CategoryProgressEntity {
  final String categoryId;
  final int incorrectAttempts;
  final int totalAttempts;

  CategoryProgressEntity({
    required this.categoryId,
    required this.incorrectAttempts,
    required this.totalAttempts,
  });
}