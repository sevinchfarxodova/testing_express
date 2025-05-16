import 'package:equatable/equatable.dart';

import '../../../domain/entity/test_response_entity.dart';

abstract class TestState extends Equatable {
  const TestState();

  @override
  List<Object?> get props => [];
}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final TestResponseEntity testResponse;

  const TestLoaded({required this.testResponse});

  @override
  List<Object?> get props => [testResponse];
}

class TestError extends TestState {
  final String message;

  const TestError({required this.message});

  @override
  List<Object?> get props => [message];
}
