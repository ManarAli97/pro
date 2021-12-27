import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart_delivery/Components/custom_button.dart';
import 'package:shopcart_delivery/Locale/locales.dart';
import 'package:shopcart_delivery/Pages/drawer.dart';
import 'package:shopcart_delivery/language_cubit.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late LanguageCubit _languageCubit;
  String? selectedLocal;
  String? selectedTheme;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<String?> languages = [
      locale.englishh,
      locale.arabicc,
      locale.frenchh,
      locale.indonesiann,
      locale.portuguesee,
      locale.spanishh,
    ];
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.languages!),
        centerTitle: true,
      ),
      drawer: AccountDrawer(),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                locale.selectPreferredLanguage!.toUpperCase(),
                style: theme.textTheme.headline6!.copyWith(fontSize: 18),
              ),
            ),
            ListView.builder(
              itemCount: languages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RadioListTile(
                  value: languages[index],
                  groupValue: selectedLocal,
                  title: Text(
                    languages[index]!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedLocal = value;
                    });
                  },
                );
              },
            ),
            Spacer(),
            CustomButton(onTap: () {
              if (selectedLocal == locale.englishh) {
                _languageCubit.selectEngLanguage();
              } else if (selectedLocal == locale.arabicc) {
                _languageCubit.selectArabicLanguage();
              } else if (selectedLocal == locale.portuguesee) {
                _languageCubit.selectPortugueseLanguage();
              } else if (selectedLocal == locale.frenchh) {
                _languageCubit.selectFrenchLanguage();
              } else if (selectedLocal == locale.spanishh) {
                _languageCubit.selectSpanishLanguage();
              } else if (selectedLocal == locale.indonesiann) {
                _languageCubit.selectIndonesianLanguage();
              }
              Navigator.pop(context);
            }),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
