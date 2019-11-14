import 'dart:ui';

import 'package:flutter/material.dart';
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

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(NumberRes.padding8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImageLogo().imageLogo(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: NumberRes.padding12),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "       ធនាគារអភិវឌ្ឍន៍ជនបទ (ធ.អ.ជ) គឺជាធនាគាររដ្ឋ ដែលបង្កើតឡើងដោយ រាជរដ្ឋាភិបាលកម្ពុជាដើម្បីចូលរួមអនុវត្ត គោលនយោបាយ របស់រាជរដ្ឋាភិបាល ក្នុងវិស័យកសិកម្ម និងសេដ្ឋកិច្ចជនបទ តាមរយៈការផ្តល់ ហិរញ្ញប្បទានដល់តួអង្គ ក្នុងខ្សែច្រវ៉ាក់ផលិតកម្មកសិកម្មរួមមាន អ្នកផលិត រហូតដល់ក្រុមហ៊ុនកែច្នៃនិងនាំចេញ ដែលអាចបំពេញនូវ កង្វះខាតរវាងតម្រូវការនិងការ ផ្គត់ផ្គង់សេវាហិរញ្ញវត្ថុ នៅតំបន់ជនបទសំដៅរួមចំណែក បង្កើនជីវភាពរស់នៅ របស់ប្រជាកសិករ និងចូលរួមអភិវឌ្ឍន៍សេដ្ឋកិច្ច សង្គម។",
              style: TextStyle(
                fontSize: FontSize.body1
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: NumberRes.width45)
        ],
      )
    );
  }
}
