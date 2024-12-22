import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/common/injection/injection.dart';
import 'package:my_quran/presentation/navigation/app_routes.dart';
import 'package:my_quran/presentation/screen/detail_quraan/detail_quraan_params.dart';
import 'package:my_quran/presentation/screen/quraan/cubit/quraan_cubit.dart';
import 'package:my_quran/presentation/widget/last_read_widget.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class QuraanScreen extends StatefulWidget {
  final String data;
  const QuraanScreen({super.key, required this.data});

  @override
  State<QuraanScreen> createState() => _QuraanScreenState();
}

class _QuraanScreenState extends State<QuraanScreen> {
  final QuraanCubit _quraanCubit = getIt<QuraanCubit>();

  @override
  void initState() {
    _quraanCubit.getSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuraanCubit>.value(value: _quraanCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          centerTitle: true,
          title: const QuranText.headingMBold(
            text: "Quraan",
            color: AppColors.primaryGreen,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const LastReadWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<QuraanCubit, QuraanState>(
                  builder: (context, state) {
                    if (state is QuraanSuccess) {
                      final data = state.data;
                      return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              print("test");
                              if (widget.data != "Quraan") {
                                context.pushNamed(AppRoutes.nrDetailAudio,
                                    extra: data.data[index]);
                              } else {
                                final params = DetailQuraanParams(
                                    noSurah: state.data.data[index].nomor,
                                    namaSurah:
                                        state.data.data[index].namaLatin);
                                context.pushNamed(AppRoutes.nrDetailQuraan,
                                    extra: params);
                              }
                            },
                            leading: Container(
                              height: 36,
                              width: 36,
                              decoration: const BoxDecoration(
                                  color: AppColors.secondaryGreen),
                              child:
                                  Center(child: Text((index + 1).toString())),
                            ),
                            title: Text(data.data[index].namaLatin),
                            subtitle: Text(data.data[index].arti),
                          );
                        },
                        itemCount: data.data.length,
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
