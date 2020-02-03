
import 'package:flutter/material.dart';
import 'package:rdbCalendar/themes/dynamic_theme.dart';
import 'package:rdbCalendar/themes/themes.dart';

void switchFont(BuildContext context, String fontname) async {
  DynamicTheme.of(context).setThemeData(ThemeData(
    primaryColor: primaryColor,
    hintColor: Colors.black87,
    buttonColor: primaryColor,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
      height: 40.0
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 14.0
      ),
      labelStyle: TextStyle(
        fontSize: 14.0
      ),
    ),
    textTheme: TextTheme(
      title: TextStyle(
        fontSize: 16.0,
        color: Colors.white
      ),
      subhead: TextStyle(
        fontSize: 14.0,
      ),
      headline: TextStyle(
        fontSize: 18.0,
      )
    ),
    fontFamily: fontname));
}