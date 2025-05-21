abstract class HomeEvent {}

class GetTaskEvent extends HomeEvent {
  GetTaskEvent();
}

class SelectLessonIndex extends HomeEvent {
  final int index;
  SelectLessonIndex(this.index);
}
