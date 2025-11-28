import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_quran/domain/entities/prayer_time/prayer_time_model.dart';
import 'package:my_quran/presentation/screen/prayer_time/cubit/prayer_time_cubit.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

import '../../../common/injection/injection.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  final PrayerTimeCubit _prayerTimeCubit = getIt<PrayerTimeCubit>();

  @override
  void initState() {
    _prayerTimeCubit.getPrayerTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PrayerTimeCubit>.value(value: _prayerTimeCubit),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.chevron_left, color: AppColors.primaryGreen),
          ),
          centerTitle: true,
          title: const QuranText.headingMBold(
            text: "Waktu Shalat",
            color: AppColors.primaryGreen,
          ),
        ),
        body: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
          builder: (context, state) {
            if (state is PrayerTimeLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryGreen),
                ),
              );
            } else if (state is PrayerTimeSuccess) {
              return PrayerTimeWidget(
                data: state.data,
                location: state.currentlocation,
              );
            } else if (state is PrayerTimeError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 60, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class PrayerTimeWidget extends StatelessWidget {
  final PrayerTimeModel data;
  final String location;

  const PrayerTimeWidget({
    required this.data,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    // Calculate Subuh (Imsak - 10 minutes)
    final imsak = _parseTime(data.imsak, now); // Assuming fajr is imsak
    final subuh = imsak.subtract(const Duration(minutes: 10));

    // Parse prayer times
    final prayerTimes = {
      'Subuh': subuh,
      'Terbit': _parseTime(data.fajr, now), // Fajr as Terbit
      'Dzuhur': _parseTime(data.dhuhr, now),
      'Ashar': _parseTime(data.asr, now),
      'Maghrib': _parseTime(data.maghrib, now),
      'Isya': _parseTime(data.isha, now),
    };

    // Find next prayer
    String nextPrayerName = 'Subuh';
    DateTime? nextPrayerTime;
    Duration? timeUntilNext;

    for (var entry in prayerTimes.entries) {
      if (now.isBefore(entry.value)) {
        nextPrayerName = entry.key;
        nextPrayerTime = entry.value;
        timeUntilNext = entry.value.difference(now);
        break;
      }
    }

    // If no prayer found today, next is Subuh tomorrow
    if (nextPrayerTime == null) {
      nextPrayerName = 'Subuh';
      nextPrayerTime = prayerTimes['Subuh']!.add(const Duration(days: 1));
      timeUntilNext = nextPrayerTime.difference(now);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Card - Next Prayer
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryGreen, Color(0xFF2ECC71)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGreen.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white70, size: 25),
                    const SizedBox(width: 4),
                    Expanded(
                      child: QuranText.bodyMRegular(
                        text: location,
                        color: Colors.white70,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                QuranText.bodyMRegular(
                  text: DateFormat("dd MMMM yyyy").format(now),
                  color: Colors.white70,
                ),
                const SizedBox(height: 20),
                const QuranText.bodyMRegular(
                  text: "Waktu Shalat Selanjutnya",
                  color: Colors.white70,
                ),
                const SizedBox(height: 8),
                QuranText.headingMBold(
                  text: nextPrayerName,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                QuranText.headingMBold(
                  text: DateFormat("HH:mm").format(nextPrayerTime),
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: QuranText.bodyMRegular(
                    text: _formatDuration(timeUntilNext!),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Prayer Times List
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildPrayerTimeItem(
                  'Subuh',
                  DateFormat("HH:mm").format(subuh),
                  Icons.wb_twilight,
                  nextPrayerName == 'Subuh',
                ),
                _buildDivider(),
                _buildPrayerTimeItem(
                  'Terbit',
                  data.fajr,
                  Icons.wb_sunny,
                  nextPrayerName == 'Terbit',
                ),
                _buildDivider(),
                _buildPrayerTimeItem(
                  'Dzuhur',
                  data.dhuhr,
                  Icons.wb_sunny,
                  nextPrayerName == 'Dzuhur',
                ),
                _buildDivider(),
                _buildPrayerTimeItem(
                  'Ashar',
                  data.asr,
                  Icons.wb_sunny_outlined,
                  nextPrayerName == 'Ashar',
                ),
                _buildDivider(),
                _buildPrayerTimeItem(
                  'Maghrib',
                  data.maghrib,
                  Icons.wb_twilight,
                  nextPrayerName == 'Maghrib',
                ),
                _buildDivider(),
                _buildPrayerTimeItem(
                  'Isya',
                  data.isha,
                  Icons.nightlight_round,
                  nextPrayerName == 'Isya',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeItem(String name, String time, IconData icon, bool isNext) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isNext ? AppColors.primaryGreen.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isNext ? AppColors.primaryGreen : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isNext ? Colors.white : Colors.grey.shade600,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: QuranText.bodyMRegular(
              text: name,
              color: isNext ? AppColors.primaryGreen : Colors.black87,
            ),
          ),
          QuranText.bodyMRegular(
            text: time,
            color: isNext ? AppColors.primaryGreen : Colors.black87,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: Colors.grey.shade200, height: 1),
    );
  }

  DateTime _parseTime(String time, DateTime now) {
    final parts = time.split(":");
    return DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return "$hours jam $minutes menit lagi";
    } else {
      return "$minutes menit lagi";
    }
  }
}
