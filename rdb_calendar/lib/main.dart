import 'package:flutter/material.dart';
import 'package:rdb_calendar/themes/dynamic_theme.dart';
import 'package:rdb_calendar/themes/themes.dart';
import 'package:rdb_calendar/ui/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => appTheme,
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: Splash(),
        );
      },
    );
  }
}