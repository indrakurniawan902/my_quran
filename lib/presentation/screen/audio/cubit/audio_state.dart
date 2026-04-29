import 'package:equatable/equatable.dart';

class AudioState extends Equatable {
  final bool isPlaying;
  final Duration currentPosition;
  final Duration totalDuration;

  const AudioState({
    required this.isPlaying,
    required this.currentPosition,
    required this.totalDuration,
  });

  factory AudioState.initial() => const AudioState(
        isPlaying: false,
        currentPosition: Duration.zero,
        totalDuration: Duration.zero,
      );

  AudioState copyWith({
    bool? isPlaying,
    Duration? currentPosition,
    Duration? totalDuration,
  }) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentPosition: currentPosition ?? this.currentPosition,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }

  @override
  List<Object> get props => [isPlaying, currentPosition, totalDuration];
}
