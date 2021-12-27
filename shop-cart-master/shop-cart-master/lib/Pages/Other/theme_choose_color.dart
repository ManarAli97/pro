import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Components/drawer.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Theme/widget/change_theme_button_widget.dart';

class ChooseColorTheme extends StatefulWidget {
  ChooseColorTheme({Key? key}) : super(key: key);

  @override
  _ChooseColorThemeState createState() => _ChooseColorThemeState();
}

class _ChooseColorThemeState extends State<ChooseColorTheme> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
        drawer: buildDrawer(context),
        appBar: AppBar(
          title: Text(locale.theme!),
          centerTitle: true,
          actions: [],
        ),
        body: FadedSlideAnimation(
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 16, right: 16, bottom: 16),
                child: Text(
                  locale.chooseTheme!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              ChangeThemeButtonWidget(),
            ],
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ));
  }
}
