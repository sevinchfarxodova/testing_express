import 'package:express_testing/features/tests_pages/presentation/bloc/test/test_selection/select_test_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/test_enum.dart';
import '../../../../domain/usecase/incorrect_attamp_usecase.dart';
import '../../../../domain/usecase/progress_create_usecase.dart';
import 'test_selection_event.dart';

class TestSelectionBloc extends Bloc<TestSelectionEvent, TestSelectionState> {
  final IncorrectAttemptsAddCountUseCase incorrectAttemptsAddCountUseCase;
  final ProgressCreateUseCase progressCreateUseCase;

  TestSelectionBloc({
    required this.incorrectAttemptsAddCountUseCase,
    required this.progressCreateUseCase,
  }) : super( TestSelectionInitial()) {
    on<SelectVariant>(_onSelectVariant);
    on<IncorrectAttemptsAddCount>(_onIncorrectAttemptsAddCount);
    on<ProgressCreate>(_onProgressCreate);
  }


  Future<void> _onSelectVariant(SelectVariant event, Emitter<TestSelectionState> emit) async {
    if (state is! TestSelectionLoaded) return;
    final currentState = state as TestSelectionLoaded;
    if (currentState.isShowTrueAnswer) return;

    emit(currentState.copyWith(isShowTrueAnswer: true));

    final String trueAnswer = currentState.testResponse.tests[currentState.currentIndex]
        .correctAnswer['uz'] ?? '';
    int trueAnswerIndex = 0;
    for (int i = 0;
    i <
        (currentState.testResponse.tests[currentState.currentIndex].answers['uz'] ??
            []).length;
    i++) {
      if (trueAnswer ==
          currentState.testResponse.tests[currentState.currentIndex].answers['uz']![i]) {
        trueAnswerIndex = i;
        break;
      }
    }

    final List<TestStatus> updatedStatuses = List.from(currentState.testStatuses);
    if (event.selectedVariantText == trueAnswer) {
      updatedStatuses[currentState.currentIndex] = TestStatus.trueAnswer;
      emit(currentState.copyWith(
        testStatuses: updatedStatuses,
        selectedVariantIndex: event.selectVariantIndex,
        correctVariantIndex: event.selectVariantIndex,
      ));
    } else {
      updatedStatuses[currentState.currentIndex] = TestStatus.wrongAnswer;
      emit(currentState.copyWith(
        testStatuses: updatedStatuses,
        selectedVariantIndex: event.selectVariantIndex,
        correctVariantIndex: trueAnswerIndex,
      ));
      add(IncorrectAttemptsAddCount(
        categoryId: currentState.testResponse.tests[currentState.currentIndex].categoryId,
      ));
    }

    await Future.delayed(const Duration(seconds: 2));

    if (currentState.currentIndex < currentState.testResponse.tests.length - 1) {
      emit(currentState.copyWith(
        currentIndex: currentState.currentIndex + 1,
        isShowTrueAnswer: false,
        selectedVariantIndex: null,
        correctVariantIndex: null,
      ));
    } else {
      add(ProgressCreate());
    }
  }

  Future<void> _onIncorrectAttemptsAddCount(
      IncorrectAttemptsAddCount event, Emitter<TestSelectionState> emit) async {
    try {
      await incorrectAttemptsAddCountUseCase(categoryId: event.categoryId);
      // No state change needed unless you want to track this in the state
    } catch (e) {
      emit(TestSelectionError(message: e.toString()));
    }
  }

  Future<void> _onProgressCreate(ProgressCreate event, Emitter<TestSelectionState> emit) async {
    if (state is! TestSelectionLoaded) return;
    final currentState = state as TestSelectionLoaded;
    try {
      final countTrueAnswer = currentState.testStatuses
          .where((status) => status == TestStatus.trueAnswer)
          .length;
      final lengthTest = currentState.testStatuses.length;
      await progressCreateUseCase(
        countTrueAnswer: countTrueAnswer,
        lengthTest: lengthTest,
      );
      // State remains unchanged; navigation is handled in TestPage listener
    } catch (e) {
      emit(TestSelectionError(message: e.toString()));
    }
  }
}