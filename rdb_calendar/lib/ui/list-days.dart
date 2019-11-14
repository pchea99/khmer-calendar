import 'package:flutter/material.dart';
import 'package:rdb_calendar/calendar/calendar-kh.dart';
import 'package:rdb_calendar/core/config.dart';
import 'package:rdb_calendar/model/month.dart';
import 'package:rdb_calendar/res/fontsize.dart';
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
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody(){
    List<Widget> widgets = [];
    DateTime now = DateTime.now();
    getMonthEn.forEach((k, m){
      DateTime date = new DateTime(now.year, int.parse(k), 1);
      Map khmerDate = RDBCalendar().getKhmerLunarString(date);

      widgets.add(_buildContent(khmerDate['mm'], int.parse(k)));
    });

    return SingleChildScrollView(
      child: Column(
        children: widgets,
      ),
    );
  }

  Widget _buildContent(String mmKh, int numMonth){
    return Column(
      children: <Widget>[
        _buildMM(mmKh, numMonth),
        Footer().buildFooter(_month, numMonth)
      ],
    );
  }

  Widget _buildMM(String mmKh, int numMonth){
    return Row(
      children: <Widget>[
        _buildTextHeader(mmKh),
        _buildTextHeader(getMonthKh[numMonth]),
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
