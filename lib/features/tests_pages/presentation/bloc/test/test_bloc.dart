import 'package:express_testing/features/tests_pages/domain/usecase/test_usecase.dart';
import 'package:express_testing/features/tests_pages/presentation/bloc/test/test_options_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tests_event.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final GetTestsUseCase getTestsUseCase;

  TestBloc({required this.getTestsUseCase}) : super(TestInitial()) {
    on<FetchTestsEvent>((event, emit) async {
      emit(TestLoading());

      try {
        final result = await getTestsUseCase(
          limit: event.limit,
          offset: event.offset,
          categoryId: event.categoryId,
          search: event.search,
        );
        emit(TestLoaded(testResponse: result));
      } catch (e) {
        emit(TestError(message: e.toString()));
      }
    });
  }
}
