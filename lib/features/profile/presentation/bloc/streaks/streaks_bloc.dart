import 'package:express_testing/features/profile/presentation/bloc/streaks/streaks_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/streaks_usecase.dart';
import '../profile_event.dart';

class StreakBloc extends Bloc<ProfileEvent, StreakState> {
  final GetStreaksUseCase getStreaksUseCase;

  StreakBloc({required this.getStreaksUseCase}) : super(StreakInitial()) {
    on<StreakEvent>((event, emit) async {
      emit(StreakLoading());
      try {
        final result = await getStreaksUseCase.call();
        emit(StreakLoaded(result));
      } catch (e) {
        emit(StreakError(e.toString()));
      }
    });
  }
}
