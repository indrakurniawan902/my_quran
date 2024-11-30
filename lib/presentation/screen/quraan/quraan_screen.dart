import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/common/injection/injection.dart';
import 'package:my_quran/presentation/screen/quraan/cubit/quraan_cubit.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class QuraanScreen extends StatefulWidget {
  const QuraanScreen({super.key});

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
            text: "Hafiz",
            color: AppColors.primaryGreen,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(27),
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg_stack_home.png")),
                    borderRadius: BorderRadius.all(Radius.circular(23))),
                child: const Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: QuranText.headingMBold(
                        text: "Quran",
                        color: AppColors.primaryGreen,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<QuraanCubit, QuraanState>(
                  builder: (context, state) {
                    if (state is QuraanSuccess) {
                      final data = state.data;
                      return ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
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
