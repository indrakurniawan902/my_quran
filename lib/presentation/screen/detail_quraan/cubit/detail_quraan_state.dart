part of 'detail_quraan_cubit.dart';

sealed class DetailQuraanState extends Equatable {
  const DetailQuraanState();

  @override
  List<Object> get props => [];
}

final class DetailQuraanInitial extends DetailQuraanState {}

final class DetailQuraanLoading extends DetailQuraanState {}

final class DetailQuraanSuccess extends DetailQuraanState {
  final DetailSurah data;

  const DetailQuraanSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class DetailQuraanError extends DetailQuraanState {
  final String error;

  const DetailQuraanError(this.error);

  @override
  List<Object> get props => [error];
}
