import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rdbCalendar/themes/dynamic_theme.dart';
import 'package:rdbCalendar/themes/themes.dart';
import 'package:rdbCalendar/ui/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
