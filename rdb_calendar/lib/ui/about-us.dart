import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rdb_calendar/res/fontsize.dart';
import 'package:rdb_calendar/res/number.dart';
import 'package:rdb_calendar/res/string.dart';
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
        title: StringRes.aboutUs,
        isTitleCenter: true
      ),
      body: Container(
        padding: EdgeInsets.all(NumberRes.padding8),
        child: Text(
          "ធនាគារអភិវឌ្ឍន៍ជនបទ (ធ.អ.ជ) គឺជាធនាគាររដ្ឋ ដែលបង្កើតឡើងដោយ រាជរដ្ឋាភិបាលកម្ពុជា ដើម្បីចូលរួមអនុវត្តគោលនយោបាយរបស់រាជរដ្ឋាភិបាល ក្នុងវិស័យកសិកម្ម និងសេដ្ឋកិច្ចជនបទ តាមរយៈការផ្តល់ហិរញ្ញប្បទានដល់តួអង្គ ក្នុងខ្សែច្រវ៉ាក់ផលិតកម្មកសិកម្ម រួមមាន អ្នកផលិតរហូត ដល់ក្រុមហ៊ុនកែច្នៃ និងនាំចេញដែលអាចបំពេញ នូវកង្វះខាតរវាងតម្រូវការ និងការផ្គត់ផ្គង់សេវាហិរញ្ញវត្ថុនៅតំបន់ជនបទ សំដៅរួមចំណែកបង្កើនជីវភាពរស់នៅ របស់ប្រជាកសិករ និងចូលរួមអភិវឌ្ឍន៍សេដ្ឋកិច្ច សង្គម។",
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: FontSize.body1
          ),
        )
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(NumberRes.padding8),
            child: Text(
              "App version: 1.0.1",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.caption
              ),
            ),
          ),
        ],
      )
    );
  }
}
