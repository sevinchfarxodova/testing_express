import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repository/auth_repo.dart';
import '../auth_event.dart';
import 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<AuthEvent, ConfirmCodeState> {
  final AuthRepo authRepo;

  ConfirmCodeBloc(this.authRepo) : super(ConfirmCodeInitial()) {
    on<ConfirmCodeEvent>(_confirmCode);
  }

  Future<void> _confirmCode(
    ConfirmCodeEvent event,
    Emitter<ConfirmCodeState> emit,
  ) async {
    emit(ConfirmCodeLoading());
    final result = await authRepo.confirm(
      phoneNumber: event.phoneNumber,
      verificationCode: event.verificationCode,
    );
    if (result.errorText.isEmpty) {
      emit(ConfirmCodeSuccess(networkResponse: result));
    } else {
      emit(ConfirmCodeError());
    }
  }
}
