import 'package:bloc/bloc.dart';
import 'package:express_testing/features/lesson/domain/usecases/get_task_list_usecase.dart';
import '../../../domain/usecases/get_task_usecase.dart';
import '../home_event.dart';
import 'get_task_state.dart';

class GetTaskBloc extends Bloc<HomeEvent, GetTaskState> {
  final GetTaskListUseCase getTaskListUseCase;

  GetTaskBloc(this.getTaskListUseCase) : super(GetTaskInitial()) {
    on<GetTaskEvent>((event, emit) async {
      emit(GetTaskLoading());

      try {
        final task = await getTaskListUseCase.fetchTaskList();
        emit(GetTaskSuccess(dailyTaskEntity: task));
      } catch (e) {
        emit(GetTaskError(error: e.toString()));
      }
    });
  }
}
