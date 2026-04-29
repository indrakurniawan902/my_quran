import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/repositories/audio_repository.dart';

import 'audio_state.dart';

@injectable
class AudioCubit extends Cubit<AudioState> {
  final AudioRepository _audioRepository;
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration>? _durationSub;
  StreamSubscription<void>? _completeSub;

  AudioCubit(this._audioRepository) : super(AudioState.initial()) {
    _initStreams();
  }

  void _initStreams() {
    _positionSub = _audioRepository.onPositionChanged.listen((pos) {
      emit(state.copyWith(currentPosition: pos));
    });

    _durationSub = _audioRepository.onDurationChanged.listen((dur) {
      emit(state.copyWith(totalDuration: dur));
    });

    _completeSub = _audioRepository.onPlayerComplete.listen((_) {
      emit(state.copyWith(
        currentPosition: Duration.zero,
        isPlaying: false,
      ));
    });
  }

  Future<void> playAudio(String url) async {
    await _audioRepository.playAudio(url);
    emit(state.copyWith(isPlaying: true));
  }

  Future<void> pauseAudio() async {
    await _audioRepository.pauseAudio();
    emit(state.copyWith(isPlaying: false));
  }

  Future<void> seekAudio(double seconds) async {
    await _audioRepository.seekAudio(Duration(seconds: seconds.toInt()));
  }

  @override
  Future<void> close() {
    _positionSub?.cancel();
    _durationSub?.cancel();
    _completeSub?.cancel();
    // Disposal of the plugin instance is handled via injectable's @disposeMethod when the scope is destroyed or we can manually invoke it.
    // However, it's safer to just dispose it right here because AudioCubit governs its lifecycle.
    _audioRepository.dispose();
    return super.close();
  }
}
