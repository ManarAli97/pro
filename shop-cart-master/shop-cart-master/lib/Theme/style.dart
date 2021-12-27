import 'package:flutter/material.dart';
import 'package:shopcart/Theme/colors.dart';

//Color kMainColor = Color(0xffFF9900);

//app theme
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: kWhiteColor,
  backgroundColor: Colors.black,
  primaryColor: kMainColor,
  bottomAppBarColor: Colors.black,
  dividerColor: Color(0xffacacac),
  disabledColor: kDisabledColor,
  //buttonColor: kMainColor,
  indicatorColor: kMainColor,
  //accentColor: kMainColor,
  cardColor: Color(0xff222e3e),
  bottomAppBarTheme: BottomAppBarTheme(color: kMainColor),
  appBarTheme: AppBarTheme(
    color: Colors.black12,
    elevation: 0.0,
  ),

  //text theme which contains all text styles
  textTheme: TextTheme(
    //default text style of Text Widget
    bodyText1: TextStyle(color: kMainTextColor, fontSize: 18),
    bodyText2: TextStyle(color: kMainTextColor),
    subtitle1: TextStyle(
        color: kMainTextColor, fontWeight: FontWeight.w500, fontSize: 17),
    subtitle2: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w400),
    headline3: TextStyle(fontSize: 20),
    headline5: TextStyle(fontWeight: FontWeight.bold),
    headline6: TextStyle(color: Colors.black),
    caption: TextStyle(),
    overline: TextStyle(),
    button: TextStyle(
        fontSize: 18, color: kMainTextColor, fontWeight: FontWeight.w500),
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
