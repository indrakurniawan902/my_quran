part of 'prayer_time_cubit.dart';

sealed class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

final class PrayerTimeInitial extends PrayerTimeState {}

final class PrayerTimeLoading extends PrayerTimeState {}

final class PrayerTimeSuccess extends PrayerTimeState {
  final PrayerTimeModel data;
  final String currentlocation;

  const PrayerTimeSuccess({required this.data, required this.currentlocation});

  @override
  List<Object> get props => [data];
}

final class PrayerTimeError extends PrayerTimeState {
  final String message;

  const PrayerTimeError({required this.message});

  @override
  List<Object> get props => [message];
}
