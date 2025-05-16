import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:express_testing/features/auth/domain/repository/auth_repo.dart';
import 'package:express_testing/features/auth/presentation/bloc/auth_event.dart';
import 'package:express_testing/features/auth/presentation/bloc/sendSms/send_sms_state.dart';

class SendSmsBloc extends Bloc<AuthEvent, SendSmsState> {
  final AuthRepo authRepo;

  SendSmsBloc({required this.authRepo}) : super(SendSmsInitial()) {
    on<SendSmsEvent>(_onSendSms);
  }

  Future<void> _onSendSms(
    SendSmsEvent event,
    Emitter<SendSmsState> emit,
  ) async {
    emit(SendSmsLoading());
    final result = await authRepo.sendSms(event.phoneNumber);
    if (result.errorText.isEmpty) {
      emit(SendSmsSuccess(networkResponse: result));
    } else {
      emit(SendSmsError());
    }
  }
}
