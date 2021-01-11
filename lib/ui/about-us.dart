import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rdbCalendar/res/color.dart';
import 'package:rdbCalendar/res/fontsize.dart';
import 'package:rdbCalendar/res/number.dart';
import 'package:rdbCalendar/res/string.dart';
import 'package:rdbCalendar/widget/appbar-view.dart';
import 'package:rdbCalendar/widget/image-logo.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final String _aboutUs = "ធនាគារអភិវឌ្ឍន៍ជនបទ (អេ អ ឌី​ ប៊ី) គឺជាធនាគាររដ្ឋដែលបង្កើតឡើងដោយ"
    "រាជរដ្ឋាភិបាលកម្ពុជា ដើម្បីចូលរួមអនុវត្ត គោលនយោបាយរបស់រាជរដ្ឋាភិបាល ក្នុងវិស័យកសិកម្ម និងសេដ្ឋកិច្ចជនបទ "
    "តាមរយៈការផ្តល់ហិរញ្ញប្បទានដល់តួអង្គ ក្នុងខ្សែច្រវ៉ាក់ផលិតកម្មកសិកម្មរួមមាន អ្នកផលិតរហូត "
    "ដល់ក្រុមហ៊ុនកែច្នៃនិងនាំចេញ ដែលអាចបំពេញនូវកង្វះខាតរវាងតម្រូវការនិង ការផ្គត់ផ្គង់សេវាហិរញ្ញវត្ថុ "
    "នៅតំបន់ជនបទ សំដៅរួមចំណែកបង្កើនជីវភាព រស់នៅរបស់ប្រជាកសិករ និងចូលរួមអភិវឌ្ឍន៍សេដ្ឋកិច្ចសង្គម។";

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
    String fixedText = _aboutUs;

    return Container(
      padding: EdgeInsets.all(NumberRes.padding8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImageLogo().imageLogo(),
          Container(
            child: Text(
              fixedText,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
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
