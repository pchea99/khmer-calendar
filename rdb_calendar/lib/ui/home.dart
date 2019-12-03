import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rdbCalendar/calendar/calendar-kh.dart';
import 'package:rdbCalendar/core/config.dart';
import 'package:rdbCalendar/model/rdb-date.dart';
import 'package:rdbCalendar/model/year.dart';
import 'package:rdbCalendar/res/color.dart';
import 'package:rdbCalendar/res/fontsize.dart';
import 'package:rdbCalendar/res/number.dart';
import 'package:rdbCalendar/res/string.dart';
import 'package:rdbCalendar/service/service.dart';
import 'package:rdbCalendar/shared-pref/shared-pref.dart';
import 'package:rdbCalendar/ui/about-us.dart';
import 'package:rdbCalendar/ui/list-days.dart';
import 'package:rdbCalendar/util/logging.dart';
import 'package:rdbCalendar/util/navigate.dart';
import 'package:rdbCalendar/widget/appbar-view.dart';
import 'package:rdbCalendar/widget/footer.dart';
import 'package:rdbCalendar/widget/header-mm-yy.dart';
import 'package:rdbCalendar/widget/text-view.dart';

import 'contact-us.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	StreamSubscription<ConnectivityResult> _subscription;
	Year _year;
	int _upperCountYY;
	int _lowerCountYY;
	int _currentIndex;
	PageController _controller;
	List<Widget> _pages;
	bool _isGenerate;

	@override
	void initState() {
		super.initState();
		DateTime now = new DateTime.now();
		_isGenerate = false;
		_currentIndex = 0;
		_year = SharedPref.getPref();
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
					if (pageId == _pages.length - 2) {
						_onNext();
					}
					if (pageId == 2) {
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
		if(!_isGenerate) {
			_generateCurrentYear(DateTime.now());
		}
	}

	Widget _buildBody({
		Map<int, Map<int, RDBDate>> dateOfMM,
		int firstWeek,
		int countWeek,
		int year,
		int currentMM
	}) {
		return Center(
		  child: SingleChildScrollView(
		  	child: Container(
		  		margin: EdgeInsets.all(NumberRes.padding8),
		  		child: Column(
		  			children: <Widget>[
							_buildHeaderDate(
									dateOfMM: dateOfMM,
									countWeek: countWeek,
									firstWeek: firstWeek
							),
		  				SizedBox(height: NumberRes.padding6),
		  				_buildViewHeader(),
		  				_buildBoxContent(
								dateOfMM: dateOfMM,
								countWeek: countWeek,
								firstWeek: firstWeek
							),
		  				Footer().buildFooter(_year.getMonth(year), currentMM),
		  				SizedBox(height: NumberRes.padding12)
		  			],
		  		),
		  	),
		  ),
		);
	}

	Widget _buildHeaderDate({
		Map<int, Map<int, RDBDate>> dateOfMM,
		int countWeek,
		int firstWeek
	}) {
		return Row(
			children: <Widget>[
				SizedBox(width: NumberRes.padding8),
				HeaderMMYY().buildHeaderMMYY(dateOfMM, firstWeek, countWeek),
				SizedBox(width: NumberRes.padding8),
			],
		);
	}

	void _onNext() {
		_upperCountYY++;
		_generateNextOneYear();
	}

	void _onPrevious() {
		_lowerCountYY--;
		_generatePreviousOneYear();
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

	Widget _buildBoxContent({
		Map<int, Map<int, RDBDate>> dateOfMM,
		int firstWeek,
		int countWeek
	}){
		List<Widget> widgets = [];
		for(int i = firstWeek; i <= countWeek; i++){
			widgets.add(_buildViewContent(dateOfMM, i));
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

	Widget _buildViewContent(Map<int, Map<int, RDBDate>> dateOfMM, int numWeek) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceAround,
			children: getWeekDayKH.keys.map((k) =>
				_buildFitContent(
					dateOfMM: dateOfMM,
					numWeek: numWeek,
					index: k
				)).toList(),
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
				child: Center(
					child: _buildHeader(index),
				),
			),
		);
	}

	Widget _buildFitContent({
		Map<int, Map<int, RDBDate>> dateOfMM,
		int numWeek,
		int index
	}) {
		RDBDate rdbDate = dateOfMM[numWeek][index];

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

	void _generateCurrentYear(DateTime now) async {
		_pages = [];
		_upperCountYY = now.year;
		_lowerCountYY = now.year;
		_generateCalendarKh(now.year, false);
		_jumpToCurrentMM(now.month - 1);
		Future.delayed(Duration(seconds: 1), (){
			if((now.month - 1) >= 10){
				_onNext();
			}
		});
	}

	void _jumpToCurrentMM(int index){
		if(_controller != null) {
			_controller.jumpToPage(index);
			_onSetState();
		}
	}

	void _generateNextOneYear() async {
		_isGenerate = true;
		_onSetState();
		Map data = {
			'year': _year,
			'numYear': _upperCountYY
		};
		List<DateYear> dateYears = await compute(_generateDateNP, data);
		dateYears.forEach((date){
			_pages.add(
					_buildBody(
							dateOfMM: date.dateOfMM,
							year: date.year,
							currentMM: date.currentMM,
							countWeek: date.countWeek,
							firstWeek: date.firstWeek
					)
			);
		});
		_isGenerate = false;
		_onSetState();
	}

	void _generatePreviousOneYear() async {
		_isGenerate = true;
		_onSetState();
		Map data = {
			'year': _year,
			'numYear': _lowerCountYY
		};
		List<DateYear> dateYears = await compute(_generateDateNP, data);
		dateYears.sort((l, r)=> r.currentMM - l.currentMM);
		dateYears.forEach((date){
			_pages.insert(0,
					_buildBody(
							dateOfMM: date.dateOfMM,
							year: date.year,
							currentMM: date.currentMM,
							countWeek: date.countWeek,
							firstWeek: date.firstWeek
					)
			);
		});
		_isGenerate = false;
		_jumpToCurrentMM(13);
	}

	void _generateCalendarKh(int year, bool isPrevious) {
		Map<int, Map<int, RDBDate>> dateOfMM;
		int countWeek;
		int firstWeek;
		int currentMM;

		for(int i = 1; i <= 12; i++){
			dateOfMM = new Map();
			countWeek = 1;
			currentMM = i;

			DateTime lastDayOfMonth = new DateTime(year, currentMM + 1, 0);
			Map<int, RDBDate> weekDay1 = new Map();

			for(int i = 1; i <= lastDayOfMonth.day; i++){
				DateTime date = new DateTime(year, currentMM, i);
				int dayNr = (date.weekday + 6) % 7;
				Map khmerDate = RDBCalendar.getKhmerLunarString(date);

				RDBDate rdbDate = new RDBDate()
					..dEn = i
					..dKh = khmerDate['d']
					..mmEn = currentMM
					..mmKh = khmerDate['mm']
					..yyEn = year
					..yyKh = khmerDate['yy']
					..animalYY = khmerDate['animalYY']
					..kr = khmerDate['kr']
					..s = khmerDate['s']
					..sak = khmerDate['sak']
					..isHoliday = _HomeState.checkIsHoliday(_year, year, currentMM, i)
				;

				if(dayNr == 0){
					countWeek++;
					weekDay1.clear();
				}
				weekDay1[date.weekday] = RDBDate.clone(rdbDate);
				dateOfMM[countWeek] = Map.from(weekDay1);
			}

			firstWeek = dateOfMM.keys.first;

			_pages.add(
					_buildBody(
							dateOfMM: dateOfMM,
							year: _upperCountYY,
							currentMM: currentMM,
							countWeek: countWeek,
							firstWeek: firstWeek
					)
			);
			_onSetState();
		}
	}

	static bool checkIsHoliday(Year year, int numYear, int currentMM, int i){
		try {
			return year.getMonth(numYear).isHoliday(
				getMonthEn[currentMM],
				RDBCalendar.convertToKhmerNum(i.toString())
			);
		}catch (e){
			return false;
		}
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

	static Future<List<DateYear>> _generateDateNP(Map data) async {
		List<DateYear> dateYears = [];
		Map<int, Map<int, RDBDate>> dateOfMM;
		int countWeek;
		int firstWeek;
		int currentMM;

		for(int i = 1; i <= 12; i++){
			dateOfMM = new Map();
			countWeek = 1;
			currentMM = i;
			DateTime lastDayOfMonth = new DateTime(data['numYear'], currentMM + 1, 0);
			Map<int, RDBDate> weekDay1 = new Map();

			for (int i = 1; i <= lastDayOfMonth.day; i++) {
				DateTime date = new DateTime(data['numYear'], currentMM, i);
				int dayNr = (date.weekday + 6) % 7;

				var khmerDate = RDBCalendar.getKhmerLunarString(date);

				RDBDate rdbDate = new RDBDate()
					..dEn = i
					..dKh = khmerDate['d']
					..mmEn = currentMM
					..mmKh = khmerDate['mm']
					..yyEn = data['numYear']
					..yyKh = khmerDate['yy']
					..animalYY = khmerDate['animalYY']
					..kr = khmerDate['kr']
					..s = khmerDate['s']
					..sak = khmerDate['sak']
					..isHoliday = _HomeState.checkIsHoliday(data['year'], data['numYear'], currentMM, i)
				;

				if(dayNr == 0){
					countWeek++;
					weekDay1.clear();
				}
				weekDay1[date.weekday] = RDBDate.clone(rdbDate);
				dateOfMM[countWeek] = Map.from(weekDay1);
			}

			firstWeek = dateOfMM.keys.first;
			DateYear dateYear = new DateYear()
				..dateOfMM = dateOfMM
				..year = data['numYear']
				..currentMM = currentMM
				..countWeek = countWeek
				..firstWeek = firstWeek
			;

			dateYears.add(dateYear);
		}

		return dateYears;
	}
}

class DateYear {
	Map<int, Map<int, RDBDate>> dateOfMM;
	int countWeek;
	int firstWeek;
	int currentMM;
	int year;

	DateYear(){
		dateOfMM = new Map();
	}
}
