part of 'quraan_cubit.dart';

abstract class QuraanState extends Equatable {
  const QuraanState();

  @override
  List<Object> get props => [];
}

class QuraanInitial extends QuraanState {}

class QuraanLoading extends QuraanState {}

class QuraanSuccess extends QuraanState {
  final Surah data;

  const QuraanSuccess({required this.data});
}

class QuraanError extends QuraanState {
  final String message;

  const QuraanError({required this.message});
}
