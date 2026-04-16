import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/common/injection/injection.dart';
import 'package:my_quran/presentation/screen/doa/cubit/doa_cubit.dart';
import 'package:my_quran/presentation/widget/doa_card.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/analytics_service.dart';
import 'package:my_quran/utils/colors.dart';

class DoaScreen extends StatefulWidget {
  const DoaScreen({super.key});

  @override
  State<DoaScreen> createState() => _DoaScreenState();
}

class _DoaScreenState extends State<DoaScreen> {
  final DoaCubit _doaCubit = getIt<DoaCubit>();
  final AnalyticsService _analyticsService = getIt<AnalyticsService>();

  // send analytics to firebase
  Future<void> _sendAnalyticEventPage() async {
    await _analyticsService.analytics.logEvent(name: "page_viewed_doa", parameters: <String, Object>{
      "page_name": "doa",
      "section_name": "doa",
    });
  }

  Future<void> _sendAnalyticEventClick(String name) async {
    await _analyticsService.analytics.logEvent(name: "doa_clicked_list", parameters: <String, Object>{
      "section_name": name,
    });
  }

  @override
  void initState() {
    _sendAnalyticEventPage();
    _doaCubit.getDoa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DoaCubit>.value(value: _doaCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.chevron_left,
                color: AppColors.white,
              )),
          centerTitle: true,
          title: const QuranText.headingMBold(
            text: "Doa-doa Pilihan",
            color: AppColors.primaryGreen,
          ),
        ),
        body: BlocBuilder<DoaCubit, DoaState>(
          builder: (context, state) {
            if (state is DoaSuccess) {
              return ListView.builder(
                  itemCount: state.doa.length,
                  itemBuilder: (context, index) {
                    final doa = state.doa[index];
                    return DoaCard(
                      title: doa.judul,
                      arabic: doa.arab,
                      latin: doa.latin,
                      translation: doa.terjemah,
                      onChangeExpansion: (value) {
                        if (value) {
                          _sendAnalyticEventClick(doa.judul);
                        }
                      },
                    );
                  });
            }
            if (state is DoaLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DoaError) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
