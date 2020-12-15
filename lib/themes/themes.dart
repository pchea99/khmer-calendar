import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:rdbCalendar/res/color.dart';
import 'package:rdbCalendar/res/fontsize.dart';

const Color primaryColor = ColorRes.primaryColor;

class Dimens {
  const Dimens();
}

ThemeData appTheme = new ThemeData(
  primaryColor: primaryColor,
  hintColor: ColorRes.secondaryTextColor,
  buttonColor: primaryColor,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
    height: 40.0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: FontSize.body2
    ),
    labelStyle: TextStyle(
      fontSize: FontSize.body2
    ),
  ),
  fontFamily: GlobalConfiguration().get("font_kh"));

const double elevation = 0.5;