import 'package:equatable/equatable.dart';
import '../../../domain/entity/streak_response_entity.dart';

abstract class StreakState extends Equatable {
  const StreakState();

  @override
  List<Object?> get props => [];
}

class StreakInitial extends StreakState {}

class StreakLoading extends StreakState {}

class StreakLoaded extends StreakState {
  final StreakResponseEntity streak;

  const StreakLoaded(this.streak);

  @override
  List<Object?> get props => [streak];
}

class StreakError extends StreakState {
  final String message;

  const StreakError(this.message);

  @override
  List<Object?> get props => [message];
}
