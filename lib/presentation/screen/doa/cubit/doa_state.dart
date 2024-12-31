part of 'doa_cubit.dart';

sealed class DoaState extends Equatable {
  const DoaState();

  @override
  List<Object> get props => [];
}

final class DoaInitial extends DoaState {}

final class DoaLoading extends DoaState {}

final class DoaSuccess extends DoaState {
  final List<DoaData> doa;

  const DoaSuccess({required this.doa});
}

final class DoaError extends DoaState {
  final String error;
  const DoaError({required this.error});
}
