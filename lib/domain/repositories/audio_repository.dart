abstract class AudioRepository {
  Future<void> playAudio(String url);
  Future<void> pauseAudio();
  Future<void> seekAudio(Duration position);
  
  Stream<Duration> get onPositionChanged;
  Stream<Duration> get onDurationChanged;
  Stream<void> get onPlayerComplete;
  
  void dispose();
}
