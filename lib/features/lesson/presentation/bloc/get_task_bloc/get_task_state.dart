import 'package:express_testing/features/auth/domain/entity/network_response.dart';

abstract class GetTaskState {}

final class GetTaskInitial extends GetTaskState {}

final class GetTaskLoading extends GetTaskState {}

final class GetTaskSuccess extends GetTaskState {
  NetworkResponse networkResponse;

  GetTaskSuccess({required this.networkResponse});
}

final class GetTaskError extends GetTaskState {
  final String error;

  GetTaskError({required this.error});
}
