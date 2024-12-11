import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/common/injection/injection.dart';
import 'package:my_quran/domain/entities/surah/detail_surah_data.dart';
import 'package:my_quran/presentation/screen/detail_quraan/cubit/detail_quraan_cubit.dart';
import 'package:my_quran/presentation/screen/detail_quraan/detail_quraan_params.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class DetailQuraanScreen extends StatefulWidget {
  final DetailQuraanParams params;
  const DetailQuraanScreen({super.key, required this.params});

  @override
  State<DetailQuraanScreen> createState() => _DetailQuraanScreenState();
}

class _DetailQuraanScreenState extends State<DetailQuraanScreen> {
  final DetailQuraanCubit _detailQuraanCubit = getIt<DetailQuraanCubit>();

  @override
  void initState() {
    _detailQuraanCubit.getDetailSurah(widget.params.noSurah.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<DetailQuraanCubit>.value(value: _detailQuraanCubit)
        ],
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Column(
              children: [
                QuranText.headingArabicLBold(
                  text: widget.params.namaSurah,
                  color: AppColors.white,
                ),
                const SizedBox(height: 20),
                widget.params.noSurah == 9 || widget.params.noSurah == 1
                    ? const SizedBox.shrink()
                    : const QuranText.headingArabicLBold(
                        text: "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ",
                        color: AppColors.white,
                      ),
              ],
            ),
            backgroundColor: AppColors.primaryGreen,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.white,
                  ))
            ],
          ),
          body: BlocBuilder<DetailQuraanCubit, DetailQuraanState>(
            builder: (context, state) {
              if (state is DetailQuraanError) {
                return Center(child: Text('Error: ${state.error}'));
              } else if (state is DetailQuraanLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DetailQuraanSuccess) {
                return ListAyatWidget(data: state.data);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ));
  }
}

class ListAyatWidget extends StatelessWidget {
  final DetailSurah data;
  const ListAyatWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  QuranText.headingArabicLBold(
                    text: data.ayat[index].teksArab,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: QuranText.bodyLRegular(
                        text: data.ayat[index].teksIndonesia,
                        textAlign: TextAlign.justify,
                      )),
                  const Divider(),
                ],
              ),
            );
          },
          itemCount: data.jumlahAyat,
        ));
  }
}
