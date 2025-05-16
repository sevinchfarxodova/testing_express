abstract class TestEvent {
  const TestEvent();
}

class FetchTestsEvent extends TestEvent {
  final int limit;
  final int offset;
  final String? categoryId;
  final String? search;

  FetchTestsEvent({
    required this.limit,
    required this.offset,
    this.categoryId,
    this.search,
  });
}

class AnswerSelectedEvent extends TestEvent {
  final int questionIndex;
  final String selectedAnswer;
  final String language;

  AnswerSelectedEvent({
    required this.questionIndex,
    required this.selectedAnswer,
    required this.language,
  });
}


