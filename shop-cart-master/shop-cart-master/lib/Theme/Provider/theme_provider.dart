import 'package:flutter/material.dart';
import 'package:shopcart/Theme/colors.dart';
import 'package:shopcart/Theme/style.dart';
//import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isLightMode => themeMode == ThemeMode.light;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.white, //
    bottomAppBarColor: kWhiteColor,
    dividerColor: kWhiteColor,
    disabledColor: Color(0xff616161),
    //buttonColor: kMainColor,
    indicatorColor: kMainColor,
    //accentColor: kMainColor,
    cardColor: Color(0xff222e3e),
    bottomAppBarTheme: BottomAppBarTheme(color: kMainColor),
    appBarTheme: AppBarTheme(
      color: kTransparentColor,
      elevation: 0.0,
    ),
    secondaryHeaderColor: kMainColor,
    primaryColor: kMainColor,
    colorScheme: ColorScheme.dark(),
    buttonTheme: ThemeData.dark().buttonTheme,
    textTheme: TextTheme(
      //default text style of Text Widget
      bodyText1: TextStyle(color: Colors.white, fontSize: 18),
      bodyText2: TextStyle(),
      subtitle1: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
      subtitle2: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      headline3: TextStyle(fontSize: 20),
      headline5: TextStyle(fontWeight: FontWeight.bold),
      headline6: TextStyle(color: Colors.white),
      caption: TextStyle(),
      overline: TextStyle(),
      button: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
    ),
  );
  static final lightTheme = appTheme;
}
