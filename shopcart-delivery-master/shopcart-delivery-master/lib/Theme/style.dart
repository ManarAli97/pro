import 'package:flutter/material.dart';

Color disabledColor = Color(0xff747474);
Color scaffoldBackgroundColor = Colors.white;

//app theme
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  backgroundColor: Colors.black,
  primaryColor: Color(0xffFF9900),
  bottomAppBarColor: Colors.white,
  dividerColor: Color(0xffF8F9FD),
  disabledColor: disabledColor,
  //buttonColor: Color(0xffFF9900),
  focusColor: Color(0xff7b49c3),
  indicatorColor: Color(0xffFF9900),
  //accentColor: Color(0xffFF9900),
  cardColor: Color(0xff222e3e),
  hintColor: Color(0xffa3a3a3),
  bottomAppBarTheme: BottomAppBarTheme(color: Color(0xffFF9900)),
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
  ),
  //text theme which contains all text styles
  textTheme: TextTheme(
    //default text style of Text Widget
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    subtitle1: TextStyle(),
    subtitle2: TextStyle(color: disabledColor),
    headline3: TextStyle(),
    headline4:
        TextStyle(color: scaffoldBackgroundColor, fontWeight: FontWeight.bold),
    headline5:
        TextStyle(color: scaffoldBackgroundColor, fontWeight: FontWeight.bold),
    headline6: TextStyle(color: disabledColor),
    caption: TextStyle(),
    overline: TextStyle(),
    button: TextStyle(),
  ),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
