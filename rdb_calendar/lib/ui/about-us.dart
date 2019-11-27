import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rdb_calendar/res/color.dart';
import 'package:rdb_calendar/res/fontsize.dart';
import 'package:rdb_calendar/res/number.dart';
import 'package:rdb_calendar/res/string.dart';
import 'package:rdb_calendar/widget/appbar-view.dart';
import 'package:rdb_calendar/widget/image-logo.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBarView().buildAppBar(
        title: StringRes.aboutUs,
        isTitleCenter: true
      ),
      body: SingleChildScrollView(
        child: _buildBody()
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: ColorRes.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(NumberRes.padding8),
            child: Text(
              "App version: 1.0.1",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.body3
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget _buildBody() {
    double width = MediaQuery.of(context).size.width;
    print("----- $width");

    return Container(
      padding: EdgeInsets.all(NumberRes.padding8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImageLogo().imageLogo(),
          Container(
            height: NumberRes.width235,
            child: Image.asset(
              'assets/images/about_rdb.png',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(height: NumberRes.width45)
            ],
          )
        ],
      )
    );
  }
}
