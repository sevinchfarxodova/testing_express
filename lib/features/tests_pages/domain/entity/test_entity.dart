class TestEntity {
  final Map<String, List<String>> answers;
  final Map<String, String> category;
  final String categoryId;
  final Map<String, String> correctAnswer;
  final Map<String, String> description;
  final String id;
  final String mediaUrl;
  final Map<String, String> title;

  TestEntity({
    required this.answers,
    required this.category,
    required this.categoryId,
    required this.correctAnswer,
    required this.description,
    required this.id,
    required this.mediaUrl,
    required this.title,
  });
}