import 'package:express_testing/features/lesson/domain/entity/tasks_entity.dart';

abstract class GetTaskState {}

final class GetTaskInitial extends GetTaskState {}

final class GetTaskLoading extends GetTaskState {}

final class GetTaskSuccess extends GetTaskState {
  DailyTaskEntity dailyTaskEntity;

  GetTaskSuccess({required this.dailyTaskEntity});
}

final class GetTaskError extends GetTaskState {
  final String error;

  GetTaskError({required this.error});
}
