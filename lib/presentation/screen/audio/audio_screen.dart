import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:my_quran/presentation/screen/audio/cubit/audio_cubit.dart';
import 'package:my_quran/presentation/screen/audio/cubit/audio_state.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class AudioScreen extends StatelessWidget {
  final Datum surah;
  const AudioScreen({super.key, required this.surah});

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
          text: 'Surah ${surah.namaLatin}',
          color: AppColors.audioGreenSecondary,
        ),
      ),
      body: BlocBuilder<AudioCubit, AudioState>(
        builder: (context, state) {
          final maxDurationInSecs = state.totalDuration.inSeconds.toDouble();
          final currentPositionInSecs = state.currentPosition.inSeconds.toDouble();
          final safeMax = maxDurationInSecs > 0 ? maxDurationInSecs : 1.0;
          final safeValue = currentPositionInSecs.clamp(0.0, safeMax);

          return Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/img_detail_audio.png',
                  width: double.infinity,
                  height: 450,
                ),
                Slider(
                    value: safeValue,
                    max: safeMax,
                    onChanged: (value) =>
                        context.read<AudioCubit>().seekAudio(value),
                    activeColor: AppColors.audioGreen),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatDuration(state.currentPosition)),
                    Text(formatDuration(state.totalDuration)),
                  ],
                ),
                Visibility(
                    visible: !state.isPlaying,
                    child: InkWell(
                        onTap: () {
                          final audio = surah.audioFull['05'];
                          if (audio != null) {
                            context.read<AudioCubit>().playAudio(audio);
                          } else {
                            print('Invalid URL');
                          }
                        },
                        child: const Icon(
                          Icons.play_circle_fill_rounded,
                          size: 50,
                          color: AppColors.audioGreen,
                        ))),
                Visibility(
                    visible: state.isPlaying,
                    child: InkWell(
                        onTap: () {
                          context.read<AudioCubit>().pauseAudio();
                        },
                        child: const Icon(
                          Icons.pause_circle_filled_rounded,
                          size: 50,
                          color: AppColors.audioGreen,
                        )))
              ],
            ),
          );
        },
      ),
    );
  }
}

