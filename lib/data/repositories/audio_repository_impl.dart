import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/repositories/audio_repository.dart';

@Injectable(as: AudioRepository)
class AudioRepositoryImpl implements AudioRepository {
  final AudioPlayer _audioPlayer;

  AudioRepositoryImpl() : _audioPlayer = AudioPlayer();

  @override
  Future<void> playAudio(String url) async {
    await _audioPlayer.play(UrlSource(url));
  }

  @override
  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
  }

  @override
  Future<void> seekAudio(Duration position) async {
    await _audioPlayer.seek(position);
  }

  @override
  Stream<Duration> get onPositionChanged => _audioPlayer.onPositionChanged;

  @override
  Stream<Duration> get onDurationChanged => _audioPlayer.onDurationChanged;

  @override
  Stream<void> get onPlayerComplete => _audioPlayer.onPlayerComplete;

  @override
  void dispose() {
    _audioPlayer.dispose();
  }
}
