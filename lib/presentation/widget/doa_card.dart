import 'package:flutter/material.dart';

class DoaCard extends StatelessWidget {
  final String title;
  final String arabic;
  final String latin;
  final String translation;
  final Function(bool) onChangeExpansion;
  const DoaCard(
      {super.key,
      required this.title,
      required this.arabic,
      required this.latin,
      required this.translation,
      required this.onChangeExpansion});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      margin: const EdgeInsets.all(15),
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.all(8),
            onExpansionChanged: (value) {
              onChangeExpansion(value);
            },
            title: Text(title,
                style: const TextStyle(
                    color: Color(0xff0D1549),
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                arabic,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                latin,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                translation,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
