import 'package:flutter/material.dart';
import 'package:rdb_calendar/calendar/calendar-kh.dart';
import 'package:rdb_calendar/core/config.dart';
import 'package:rdb_calendar/model/month.dart';
import 'package:rdb_calendar/res/color.dart';
import 'package:rdb_calendar/res/fontsize.dart';
import 'package:rdb_calendar/res/number.dart';
import 'package:rdb_calendar/res/string.dart';
import 'package:rdb_calendar/shared-pref/shared-pref.dart';
import 'package:rdb_calendar/widget/appbar-view.dart';
import 'package:rdb_calendar/widget/footer.dart';
import 'package:rdb_calendar/widget/text-view.dart';

class ListDays extends StatefulWidget {
  @override
  _ListDaysState createState() => _ListDaysState();
}

class _ListDaysState extends State<ListDays> {
  Month _month;

  @override
  void initState() {
    super.initState();
    _month = SharedPref.getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView().buildAppBar(
        title: StringRes.publicHoliday,
        isTitleCenter: true
      ),
      body: Container(
        margin: EdgeInsets.all(NumberRes.padding8),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody(){
    List<Widget> widgets = [];
    DateTime now = DateTime.now();
    getMonthEn.forEach((k, m){
      DateTime startDate = new DateTime(now.year, k, 1);
      DateTime endDate = new DateTime(now.year, k, 25);
      Map startMMKh = RDBCalendar().getKhmerLunarString(startDate);
      Map endMMKh = RDBCalendar().getKhmerLunarString(endDate);

      if(_isWarningDay(m)) {
        widgets.add(_buildContent(_getMMKh(startMMKh, endMMKh), k));
      }
    });

    return SingleChildScrollView(
      child: Column(
        children: widgets,
      ),
    );
  }

  String _getMMKh(Map startMMKh, Map endMMKh) {
    if(startMMKh['mm'] == endMMKh['mm']){
      return startMMKh['mm'];
    }

    return startMMKh['mm'] +"-"+ endMMKh['mm'];
  }

  bool _isWarningDay(m) {
    return (_month.getHoliday(m) != null && _month.getHoliday(m).isNotEmpty) ||
      (_month.getOther(m) != null && _month.getOther(m).isNotEmpty);
  }

  Widget _buildContent(String mmKh, int numMonth){
    return Container(
      color: ColorRes.white,
      padding: EdgeInsets.all(NumberRes.padding8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMM(mmKh, numMonth),
          SizedBox(height: NumberRes.padding6),
          Footer().buildFooter(_month, numMonth)
        ],
      ),
    );
  }

  Widget _buildMM(String mmKh, int numMonth){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildTextHeader(mmKh),
        _buildTextHeader(getMonthKh[numMonth] +" "+ getMonthEn[numMonth]),
      ],
    );
  }

  Widget _buildTextHeader(String text) {
    return TextView().buildText(
      text: text,
      style: TextStyle(
        fontSize: FontSize.subtitle,
        fontWeight: FontWeight.w500
      )
    );
  }
}
