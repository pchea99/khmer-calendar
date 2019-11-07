import 'package:flutter/material.dart';
import 'package:rdb_calendar/res/string.dart';
import 'package:rdb_calendar/ui/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringRes.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}