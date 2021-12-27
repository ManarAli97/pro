import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/Components/custom_button.dart';
import 'package:shopcart/Components/drawer.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/language_cubit.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  late LanguageCubit _languageCubit;
  List<int> radioButtons = [0, -1, -1, -1, -1];
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<String?> languages = [
      locale.englishh,
      locale.spanishh,
      locale.portuguesee,
      locale.frenchh,
      locale.arabicc,
      locale.indonesiann,
    ];
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(locale.languages!),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 16, right: 16, bottom: 16),
              child: Text(
                locale.selectPreferredLanguage!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            ListView.builder(
              itemCount: languages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RadioListTile(
                  value: languages[index],
                  groupValue: selectedLanguage,
                  title: Text(
                    languages[index]!,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).backgroundColor,
                        ),
                  ),
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedLanguage = value;
                    });
                  },
                );
              },
            ),
//          ListView.builder(
//              shrinkWrap: true,
//              itemCount: languages.length,
//              itemBuilder: (context, index) {
//                return Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Row(
//                    children: [
//                      Radio(
//                          value: 0,
//                          groupValue: radioButtons[index],
//                          onChanged: (int value) {
//                            setState(() {
//                              for (int i = 0; i < radioButtons.length; i++) {
//                                radioButtons[i] = -1;
//                              }
//                              radioButtons[index] = value;
//                            });
//                          }),
//                      SizedBox(width: 15),
//                      Text(
//                        languages[index].language,
//                        style: Theme.of(context)
//                            .textTheme
//                            .subtitle1
//                            .copyWith(fontSize: 19),
//                      ),
//                    ],
//                  ),
//                );
//              }),
            Spacer(),
            CustomButton(
              label: locale.save,
              onTap: () {
                if (selectedLanguage == locale.englishh) {
                  _languageCubit.selectEngLanguage();
                } else if (selectedLanguage == locale.arabicc) {
                  _languageCubit.selectArabicLanguage();
                } else if (selectedLanguage == locale.portuguesee) {
                  _languageCubit.selectPortugueseLanguage();
                } else if (selectedLanguage == locale.frenchh) {
                  _languageCubit.selectFrenchLanguage();
                } else if (selectedLanguage == locale.spanishh) {
                  _languageCubit.selectSpanishLanguage();
                } else if (selectedLanguage == locale.indonesiann) {
                  _languageCubit.selectIndonesianLanguage();
                }
//              else if (selectedLanguage == 'Indonesian') {
//                _languageCubit.selectIndonesianLanguage();
//              }
                Navigator.pop(context);
              },
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
