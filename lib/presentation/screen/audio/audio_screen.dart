import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class AudioScreen extends StatefulWidget {
  final Datum surah;
  const AudioScreen({super.key, required this.surah});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _totalDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;
  bool isPlaying = true;

  late StreamSubscription<Duration> _durationSubscription;
  late StreamSubscription<Duration> _positionSubscription;
  late StreamSubscription<void> _completeSubscription;

  void playAudio() async {
    final String? audio = widget.surah.audioFull['05'];
    if (audio != null) {
      _audioPlayer.play(UrlSource(audio));
      setState(() {
        isPlaying = true;
      });
    } else {
      print('Invalid URL');
    }
  }

  void pauseAudio() async {
    final String? audio = widget.surah.audioFull['05'];
    if (audio != null) {
      _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      print('Invalid URL');
    }
  }

  void seekAudio(double value) async {
    await _audioPlayer.seek(Duration(seconds: value.toInt()));
  }

  @override
  void initState() {
    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });

    _completeSubscription = _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _currentPosition = Duration.zero;
        isPlaying = false;
      });
    });
    playAudio();

    super.initState();
  }

  @override
  void dispose() {
    _durationSubscription.cancel();
    _positionSubscription.cancel();
    _completeSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: QuranText.headingMBold(
          text: 'Surah ${widget.surah.namaLatin}',
          color: AppColors.audioGreenSecondary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: [
            Image.asset(
              'assets/images/img_detail_audio.png',
              width: double.infinity,
              height: 450,
            ),
            Slider(
                value: _currentPosition.inSeconds.toDouble(),
                max: _totalDuration.inSeconds.toDouble(),
                onChanged: (value) => seekAudio(value),
                activeColor: AppColors.audioGreen),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatDuration(_currentPosition)),
                Text(formatDuration(_totalDuration)),
              ],
            ),
            Visibility(
                visible: !isPlaying,
                child: InkWell(
                    onTap: () {
                      playAudio();
                    },
                    child: Icon(
                      Icons.play_circle_fill_rounded,
                      size: 50,
                      color: AppColors.audioGreen,
                    ))),
            Visibility(
                visible: isPlaying,
                child: InkWell(
                    onTap: () {
                      pauseAudio();
                    },
                    child: Icon(
                      Icons.pause_circle_filled_rounded,
                      size: 50,
                      color: AppColors.audioGreen,
                    )))
          ],
        ),
      ),
    );
  }
}
