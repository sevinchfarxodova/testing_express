abstract class HomeEvent {}

class GetTaskEvent extends HomeEvent {
  final String userId;
  GetTaskEvent(this.userId);
}

class SelectLessonIndex extends HomeEvent {
  final int index;
  SelectLessonIndex(this.index);
}
