

import '../../../domain/entity/network_response.dart';

abstract class SendSmsState {}

final class SendSmsInitial extends SendSmsState {}

final class SendSmsLoading extends SendSmsState {}

final class SendSmsSuccess extends SendSmsState {
  final NetworkResponse networkResponse;
   SendSmsSuccess({required this.networkResponse});
}

final class SendSmsError extends SendSmsState {}
