import 'package:flutter/material.dart';
import 'package:rdb_calendar/widget/appbar-view.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView().buildAppBar(
        title: 'អំពីពួកយើង',
        isTitleCenter: true
      ),
      body: Container(
        child: Text('About US'),
      ),
    );
  }
}
