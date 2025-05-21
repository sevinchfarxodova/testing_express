import '../../../domain/entity/network_response.dart';

abstract class ConfirmCodeState {}

final class ConfirmCodeInitial extends ConfirmCodeState {}
final class ConfirmCodeLoading extends ConfirmCodeState {}
final class ConfirmCodeSuccess extends ConfirmCodeState {
  final NetworkResponse networkResponse;
  ConfirmCodeSuccess({required this.networkResponse});
}
final class ConfirmCodeError extends ConfirmCodeState {}
