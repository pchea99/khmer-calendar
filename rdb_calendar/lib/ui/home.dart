import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:rdb_calendar/calendar/calendar-kh.dart';
import 'package:rdb_calendar/core/config.dart';
import 'package:rdb_calendar/model/rdb-date.dart';
import 'package:rdb_calendar/model/year.dart';
import 'package:rdb_calendar/res/color.dart';
import 'package:rdb_calendar/res/fontsize.dart';
import 'package:rdb_calendar/res/number.dart';
import 'package:rdb_calendar/res/string.dart';
import 'package:rdb_calendar/service/service.dart';
import 'package:rdb_calendar/shared-pref/shared-pref.dart';
import 'package:rdb_calendar/ui/about-us.dart';
import 'package:rdb_calendar/ui/list-days.dart';
import 'package:rdb_calendar/util/logging.dart';
import 'package:rdb_calendar/util/navigate.dart';
import 'package:rdb_calendar/widget/appbar-view.dart';
import 'package:rdb_calendar/widget/footer.dart';
import 'package:rdb_calendar/widget/header-mm-yy.dart';
import 'package:rdb_calendar/widget/text-view.dart';

import 'contact-us.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	StreamSubscription<ConnectivityResult> _subscription;
	Map<int, Map<int, RDBDate>> _dateOfMM;
	RDBCalendar _rdbCalendar;
	Year _year;
	int _currentMM;
	int _currentYY;
	int _countWeek;
	int _firstWeek;
	int _currentIndex;
	bool _isLoading;
	PageController _controller;
	List<Widget> _pages;

	@override
	void initState() {
		super.initState();
		DateTime now = new DateTime.now();
		_currentIndex = 0;
		_year = SharedPref.getPref();
		print("----- $_year");
		_generateCurrentYear(now);
		_controller = new PageController(initialPage: now.month - 1, keepPage: true);
		_subscription = Connectivity().onConnectivityChanged
			.listen((ConnectivityResult result) {
				if(result != ConnectivityResult.none){
				_getMonth();
			}
		});
	}

	@override
	void dispose() {
		_subscription.cancel();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBarView().buildAppBar(
				context: context,
				title: StringRes.appName,
				action: IconButton(
					icon: Icon(
						Icons.refresh,
						color: ColorRes.white,
					),
					onPressed: _onRefresh
				),
			),
			body: PageView(
				onPageChanged: (pageId) {
					if (pageId == _pages.length - 1) {
						_onNext();
					}
					if (pageId == 0) {
						_onPrevious();
					}
				},
				controller: _controller,
				children: _pages.map((p)=> p).toList(),
			),
			bottomNavigationBar: BottomNavigationBar(
				type: BottomNavigationBarType.fixed,
				currentIndex: _currentIndex,
				onTap: (int index) {
					_currentIndex = index;
					_onSetState();
					if(index == 1){
						Navigate.openDialog(context, AboutUs());
					}else if(index == 2){
						Navigate.openDialog(context, ContactUs());
					}else if(index == 3){
						Navigate.openDialog(context, ListDays());
					}
					_setSelectedDefault();
				},// this will be set when a new tab is tapped
				items: [
					BottomNavigationBarItem(
						icon: new Icon(Icons.home),
						title: new Text(StringRes.home),
					),
					BottomNavigationBarItem(
						icon: new Icon(Icons.people),
						title: new Text(StringRes.aboutUs),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.contacts),
						title: Text(StringRes.contactUs)
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.calendar_today),
						title: Text(StringRes.event)
					)
				],
			),
		);
	}

	void _onRefresh() {
		_generateCurrentYear(DateTime.now());
	}

	Widget _buildBody() {
		if(_isLoading){
			return Center(
				child: Container(
					child:  CircularProgressIndicator(),
				),
			);
		}

		return SingleChildScrollView(
			child: Container(
				margin: EdgeInsets.all(NumberRes.padding8),
				child: Column(
					children: <Widget>[
						_buildHeaderDate(),
						SizedBox(height: NumberRes.padding6),
						_buildViewHeader(),
						_buildBoxContent(),
						Footer().buildFooter(_year.getMonth(_currentYY), _currentMM),
						SizedBox(height: NumberRes.padding12)
					],
				),
			),
		);
	}

	Widget _buildHeaderDate() {
		return Row(
			children: <Widget>[
				SizedBox(width: NumberRes.padding8),
				HeaderMMYY().buildHeaderMMYY(_dateOfMM, _firstWeek, _countWeek),
				SizedBox(width: NumberRes.padding8),
			],
		);
	}

	void _onNext() {
		/*_currentMM++;
		_countWeek = 1;
		if (_currentMM > 12) {
			_currentMM = 1;
			_currentYY++;
		}
		_dateOfMM.clear();
		_setLoading(true);
		_generateCalendarKh();*/
		_currentYY++;
		_generateOneYear();
	}

	void _onPrevious() {
		/*if(_currentMM == 12){
			_currentYY--;
		}
		_countWeek = 1;
		if (_currentMM < 1) {
			_currentMM = 12;
			_currentYY--;
		}
		_dateOfMM.clear();
		_setLoading(true);
		_generateCalendarKh();
		_currentMM--;*/
		_currentYY--;
		_generatePreviousOneYear();
	}

	void _setLoading(bool isLoading) {
		_isLoading = isLoading;
		_onSetState();
	}

	Widget _buildViewHeader() {
		return Container(
			decoration: BoxDecoration(
				border: Border.all(color: ColorRes.grey200),
				borderRadius: BorderRadius.only(
					topLeft: Radius.circular(NumberRes.padding8),
					topRight: Radius.circular(NumberRes.padding8),
				),
				color: ColorRes.green
			),
			padding: EdgeInsets.all(NumberRes.padding3),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				children: getWeekDayKH.keys.map((k) =>
					_buildFitHeader(k)).toList(),
			),
		);
	}

	Widget _buildBoxContent(){
		List<Widget> widgets = [];
		for(int i = _firstWeek; i <= _countWeek; i++){
			widgets.add(_buildViewContent(i));
		}

		return Container(
			decoration: BoxDecoration(
				border: Border.all(color: ColorRes.grey200),
				borderRadius: BorderRadius.only(
					bottomRight: Radius.circular(NumberRes.padding8),
					bottomLeft: Radius.circular(NumberRes.padding8),
				),
				color:ColorRes.grey200
			),
			padding: EdgeInsets.all(NumberRes.padding6),
			child: Column(
				children: widgets,
			),
		);
	}

	Widget _buildViewContent(int numWeek) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceAround,
			children: getWeekDayKH.keys.map((k) =>
				_buildFitContent(numWeek, k)).toList(),
		);
	}

	Widget _buildHeader(int index) {
		return Column(
			children: <Widget>[
				_buildTextHeader(getWeekDayKH[index]),
				Container(
					margin: EdgeInsets.only(
						right: index == 7 ? NumberRes.padding3 : 0.0
					),
					child: _buildTextHeader(getWeekDayEN[index])
				),
			],
		);
	}

	Widget _buildTextHeader(String text) {
		return Container(
			padding: EdgeInsets.only(
				right: text == getWeekDayKH[5] ? NumberRes.padding12 : 0.0
			),
			child: TextView().buildText(
				text: text,
				style: TextStyle(
					color: ColorRes.white,
					fontSize: FontSize.subtitle
				)
			),
		);
	}

	Widget _buildTextContent(int index, String text, bool isHoliday) {
		return TextView().buildText(
			text: text == null || text == 'null' ? '' : text,
			style: TextStyle(
				fontSize: FontSize.body1,
				color: index == 7 || isHoliday ? ColorRes.red : ColorRes.black
			)
		);
	}

	Widget _buildTextKh(int index, String text, bool isHoliday) {
		return TextView().buildText(
			text: text == null || text == 'null' ? '' : text,
			style: TextStyle(
				fontSize: FontSize.body3,
				color: index == 7 || isHoliday ? ColorRes.red : ColorRes.black
			)
		);
	}

	Widget _buildFitHeader(int index) {
		return Flexible(
			child: Container(
				margin: EdgeInsets.all(NumberRes.padding3),
				color: ColorRes.green,
				width: NumberRes.width45,
				height: NumberRes.width45,
				child: Center(
					child: _buildHeader(index),
				),
			),
		);
	}

	Widget _buildFitContent(int numWeek, int index) {
		RDBDate rdbDate = _dateOfMM[numWeek][index];

		return Flexible(
			child: Container(
				margin: EdgeInsets.all(NumberRes.padding3),
				decoration: BoxDecoration(
					borderRadius: BorderRadius.all(Radius.circular(NumberRes.padding8)),
					color: _isToday(rdbDate) ? ColorRes.green : Colors.transparent
				),
				padding: EdgeInsets.all(NumberRes.padding3),
				width: NumberRes.width45,
				height: NumberRes.width45,
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								_getS(rdbDate) != null ?
								Container(
									child: Image.asset(
										'assets/images/s.png',
										fit: BoxFit.contain,
										width: NumberRes.width10,
										height: NumberRes.width10,
									),
								) : Container(),
								_buildTextContent(index, _getDayEn(rdbDate),_isHoliday(rdbDate)),
							],
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								_buildTextKh(index, _getDayKh(rdbDate), _isHoliday(rdbDate)),
								SizedBox(width: NumberRes.padding3),
								_buildTextKh(index, _getKr(rdbDate), _isHoliday(rdbDate)),
							],
						),
					],
				),
			),
		);
	}

	String _getDayKh(RDBDate rdbDate) {
		if(rdbDate == null){
			return null;
		}

		return rdbDate.dKh;
	}

	String _getKr(RDBDate rdbDate) {
		if(rdbDate == null){
			return null;
		}

		return rdbDate.kr;
	}

	String _getDayEn(RDBDate rdbDate) {
		if(rdbDate == null){
			return null;
		}

		return rdbDate.dEn.toString();
	}

	String _getMMEn(RDBDate rdbDate) {
		if(rdbDate == null){
			return null;
		}

		return rdbDate.mmEn.toString();
	}

	String _getYYEn(RDBDate rdbDate) {
		if(rdbDate == null){
			return null;
		}

		return rdbDate.yyEn.toString();
	}

	String _getS(RDBDate rdbDate) {
		if(rdbDate == null || rdbDate.s.isEmpty){
			return null;
		}

		return rdbDate.s;
	}

	bool _isHoliday(RDBDate rdbDate) {
		if(rdbDate == null){
			return false;
		}

		return rdbDate.isHoliday;
	}

	bool _isToday(RDBDate rdbDate) {
		if(rdbDate == null || _getDayEn(rdbDate) == null){
			return false;
		}

		return DateTime.now().year.toString() == _getYYEn(rdbDate) &&
			DateTime.now().month.toString() == _getMMEn(rdbDate) &&
			DateTime.now().day.toString() == _getDayEn(rdbDate);
	}

	void _generateCalendarKh() {
		_rdbCalendar = new RDBCalendar();
		DateTime lastDayOfMonth = new DateTime(_currentYY, _currentMM + 1, 0);
		Map<int, RDBDate> weekDay1 = new Map();

		for(int i = 1; i <= lastDayOfMonth.day; i++){
			DateTime date = new DateTime(_currentYY, _currentMM, i);
			int dayNr = (date.weekday + 6) % 7;
			Map khmerDate = _rdbCalendar.getKhmerLunarString(date);
			RDBDate rdbDate = new RDBDate()
				..dEn = i
				..dKh = khmerDate['d']
				..mmEn = _currentMM
				..mmKh = khmerDate['mm']
				..yyEn = _currentYY
				..yyKh = khmerDate['yy']
				..animalYY = khmerDate['animalYY']
				..kr = khmerDate['kr']
				..s = khmerDate['s']
				..sak = khmerDate['sak']
				..isHoliday = _checkIsHoliday(i)
			;

			if(dayNr == 0){
				_countWeek++;
				weekDay1.clear();
			}
			weekDay1[date.weekday] = RDBDate.clone(rdbDate);
			_dateOfMM[_countWeek] = Map.from(weekDay1);
		}
		_firstWeek = _dateOfMM.keys.first;
		_setLoading(false);
	}

	bool _checkIsHoliday(int i){
		try {
			return _year.getMonth(_currentYY).isHoliday(
				getMonthEn[_currentMM],
				_rdbCalendar.convertToKhmerNum(i.toString())
			);
		}catch (e){
			return false;
		}
	}

	void _generateCurrentYear(DateTime now) {
		_pages = [];
		_isLoading = true;
		_currentYY = now.year;
		_generateOneYear();
		if(_controller != null) {
			_controller.jumpToPage(now.month - 1);
			_onSetState();
		}
	}

	void _generateOneYear() {
	  for(int i = 1; i <= 12; i++){
	  	_dateOfMM = new Map();
	  	_countWeek = 1;
	  	_currentMM = i;
	  	_generateCalendarKh();
	  	_pages.add(_buildBody());
	  }
	}

	void _generatePreviousOneYear() {
	  for(int i = 12; i >= 1; i--){
	  	_dateOfMM = new Map();
	  	_countWeek = 1;
	  	_currentMM = i;
	  	_generateCalendarKh();
		  _pages.insert(0, _buildBody());
	  }
	  _controller.jumpToPage(12);
	}

	void _getMonth() {
		ServiceFS().getMonth().then((data){
			SharedPref.setPref(data);
		}).catchError((e){
			Logging.logWarning(e.toString());
		});
	}

	void _onSetState(){
		if(!mounted){
			return;
		}

		setState(() {});
	}

	void _setSelectedDefault(){
		Future.delayed(Duration(seconds: 1), (){
			_currentIndex = 0;
			_onSetState();
		});
	}
}
