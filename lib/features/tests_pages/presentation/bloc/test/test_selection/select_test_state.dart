import 'package:equatable/equatable.dart';
import '../../../../data/model/test_enum.dart';
import '../../../../domain/entity/test_response_entity.dart';

abstract class TestSelectionState extends Equatable {
  const TestSelectionState();

  @override
  List<Object?> get props => [];
}

class TestSelectionInitial extends TestSelectionState {}

class TestSelectionLoading extends TestSelectionState {}

class TestSelectionLoaded extends TestSelectionState {
  final TestResponseEntity testResponse;
  final int currentIndex;
  final List<TestStatus> testStatuses;
  final bool isShowTrueAnswer;
  final int? selectedVariantIndex;
  final int? correctVariantIndex;

  const TestSelectionLoaded({
    required this.testResponse,
    required this.currentIndex,
    required this.testStatuses,
    this.isShowTrueAnswer = false,
    this.selectedVariantIndex,
    this.correctVariantIndex,
  });

  TestSelectionLoaded copyWith({
    TestResponseEntity? testResponse,
    int? currentIndex,
    List<TestStatus>? testStatuses,
    bool? isShowTrueAnswer,
    int? selectedVariantIndex,
    int? correctVariantIndex,
  }) {
    return TestSelectionLoaded(
      testResponse: testResponse ?? this.testResponse,
      currentIndex: currentIndex ?? this.currentIndex,
      testStatuses: testStatuses ?? this.testStatuses,
      isShowTrueAnswer: isShowTrueAnswer ?? this.isShowTrueAnswer,
      selectedVariantIndex: selectedVariantIndex ?? this.selectedVariantIndex,
      correctVariantIndex: correctVariantIndex ?? this.correctVariantIndex,
    );
  }

  @override
  List<Object?> get props => [
    testResponse,
    currentIndex,
    testStatuses,
    isShowTrueAnswer,
    selectedVariantIndex,
    correctVariantIndex,
  ];
}

class TestSelectionError extends TestSelectionState {
  final String message;

  const TestSelectionError({required this.message});

  @override
  List<Object?> get props => [message];
}