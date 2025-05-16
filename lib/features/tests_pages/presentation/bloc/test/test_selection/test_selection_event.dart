import 'package:equatable/equatable.dart';

 class TestSelectionEvent extends Equatable {
  const TestSelectionEvent();

  @override
  List<Object?> get props => [];
}

class FetchTest extends TestSelectionEvent {}

class SelectVariant extends TestSelectionEvent {
  final String selectedVariantText;
  final int selectVariantIndex;

  const SelectVariant({
    required this.selectedVariantText,
    required this.selectVariantIndex,
  });

  @override
  List<Object?> get props => [selectedVariantText, selectVariantIndex];
}

class IncorrectAttemptsAddCount extends TestSelectionEvent {
  final String categoryId;

  const IncorrectAttemptsAddCount({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class ProgressCreate extends TestSelectionEvent {}