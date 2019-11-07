import 'package:calendar_app/calendar/calendar-kh.dart';
import 'package:calendar_app/core/config.dart';
import 'package:calendar_app/model/rdb-date.dart';
import 'package:calendar_app/res/color.dart';
import 'package:calendar_app/res/fontsize.dart';
import 'package:calendar_app/res/number.dart';
import 'package:calendar_app/res/string.dart';
import 'package:calendar_app/widget/appbar-view.dart';
import 'package:calendar_app/widget/text-view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	Map<int, Map<int, RDBDate>> _dateOfMM;
	int _currentMM;
	int _currentYY;
	int _countWeek;
	int _firstWeek;
	bool _isLoading;

	@override
	void initState() {
		super.initState();
		_dateOfMM = new Map();
		_isLoading = false;
		_countWeek = 1;
		DateTime now = new DateTime.now();
		_currentMM = now.month;
		_currentYY = now.year;
		_generateCalendarKh();
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
	    body: _buildBody(),
    );
  }

	void _onRefresh() {
		_currentMM = DateTime.now().month;
		_currentYY = DateTime.now().year;
		_countWeek = 1;
		_dateOfMM.clear();
		_setLoading(true);
		_generateCalendarKh();
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
					],
				),
			),
		);
	}

	Widget _buildHeaderDate() {
		return Row(
			children: <Widget>[
				_buildPreviousBtn(),
				_buildHeaderMMYY(),
				_buildNextBtn(),
			],
		);
	}

	InkWell _buildNextBtn() {
		return InkWell(
			child: Container(
				width: 35.0,
				height: NumberRes.width45,
				child: Icon(
					Icons.arrow_forward_ios,
					color: ColorRes.blue,
				),
			),
			onTap: _onNext,
		);
	}

	Expanded _buildHeaderMMYY() {
		return Expanded(
			child: Column(
				children: <Widget>[
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							_buildTextMMKh(),
							_buildTextMMEn(),
						],
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							_buildTextYYKh(),
							_buildTextMMYYEn(),
						],
					),
				],
			),
		);
	}

	InkWell _buildPreviousBtn() {
		return InkWell(
			child: Container(
				width: 35.0,
				height: NumberRes.width45,
				child: Icon(
					Icons.arrow_back_ios,
					color: ColorRes.blue,
				),
			),
			onTap: _onPrevious,
		);
	}

	void _onNext() {
		_currentMM++;
		_countWeek = 1;

		if (_currentMM > 12) {
			_currentMM = 1;
			_currentYY++;
		}

		_dateOfMM.clear();
		_setLoading(true);
		_generateCalendarKh();
	}

	void _onPrevious() {
		_currentMM--;
		_countWeek = 1;

		if (_currentMM < 1) {
			_currentMM = 12;
			_currentYY--;
		}

		_dateOfMM.clear();
		_setLoading(true);
		_generateCalendarKh();
	}

	void _setLoading(bool isLoading) {
	  _isLoading = isLoading;
	  _onSetState();
	}

	Widget _buildTextMMYYEn() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				_buildText(
					getMonthEn[_dateOfMM[2][1].mmEn],
					TextStyle(
						fontSize: FontSize.body1,
						fontWeight: FontWeight.w500
					)
				),
				SizedBox(width: NumberRes.padding4),
				_buildText(
					_dateOfMM[2][1].yyEn.toString(),
					TextStyle(
						fontSize: FontSize.body1,
						fontWeight: FontWeight.w500
					)
				),
			],
		);
	}

	Widget _buildTextYYKh() {
		return Container(
			margin: EdgeInsets.only(right: NumberRes.padding12),
		  child: _buildText(
		  	"ព.ស​ "+ _dateOfMM[_countWeek][1].yyKh,
		  	TextStyle(
		  		fontSize: FontSize.body1,
				  fontWeight: FontWeight.w500
		  	)
		  ),
		);
	}

	Widget _buildTextMMEn() {
		return _buildText(
			getMonthKh[_dateOfMM[2][1].mmEn],
			TextStyle(
				fontSize: FontSize.subtitle,
				fontWeight: FontWeight.w500
			)
		);
	}

	Widget _buildTextMMKh() {
		return _buildText(
			_getStartMMKh() != _getEndMMKh()
				? _getStartMMKh() +"-"+ _getEndMMKh() +" ឆ្នាំ"+ _dateOfMM[2][1].animalYY
				:  _getStartMMKh() +" ឆ្នាំ"+ _dateOfMM[2][1].animalYY,
			TextStyle(
				fontSize: FontSize.subtitle,
				fontWeight: FontWeight.w500
			)
		);
	}

	String _getStartMMKh(){
		if(_dateOfMM[_firstWeek][1] != null && _dateOfMM[_firstWeek][1].mmKh != null) {
			return _dateOfMM[_firstWeek][1].mmKh;
		} else if(_dateOfMM[_firstWeek][1] != null && _dateOfMM[_firstWeek][2].mmKh != null) {
			return _dateOfMM[_firstWeek][2].mmKh;
		} else if(_dateOfMM[_firstWeek][1] != null && _dateOfMM[_firstWeek][3].mmKh != null) {
			return _dateOfMM[_firstWeek][3].mmKh;
		}else if(_dateOfMM[_firstWeek][1] != null && _dateOfMM[_firstWeek][4].mmKh != null) {
			return _dateOfMM[_firstWeek][4].mmKh;
		}else if(_dateOfMM[_firstWeek][1] != null && _dateOfMM[_firstWeek][5].mmKh != null) {
			return _dateOfMM[_firstWeek][5].mmKh;
		}else if(_dateOfMM[_firstWeek][1] != null && _dateOfMM[_firstWeek][6].mmKh != null) {
			return _dateOfMM[_firstWeek][6].mmKh;
		}else {
			return _dateOfMM[_firstWeek][7].mmKh;
		}
	}

	String _getEndMMKh(){
		if(_dateOfMM[_countWeek][7] != null && _dateOfMM[_countWeek][7].mmKh != null) {
			return _dateOfMM[_countWeek][7].mmKh;
		} else if(_dateOfMM[_countWeek][6] != null && _dateOfMM[_countWeek][6].mmKh != null) {
			return _dateOfMM[_countWeek][6].mmKh;
		} else if(_dateOfMM[_countWeek][5] != null && _dateOfMM[_countWeek][5].mmKh != null) {
			return _dateOfMM[_countWeek][5].mmKh;
		}else if(_dateOfMM[_countWeek][4] != null && _dateOfMM[_countWeek][4].mmKh != null) {
			return _dateOfMM[_countWeek][4].mmKh;
		}else if(_dateOfMM[_countWeek][3] != null && _dateOfMM[_countWeek][3].mmKh != null) {
			return _dateOfMM[_countWeek][3].mmKh;
		}else if(_dateOfMM[_countWeek][2] != null && _dateOfMM[_countWeek][2].mmKh != null) {
			return _dateOfMM[_countWeek][2].mmKh;
		}else {
			return _dateOfMM[_countWeek][1].mmKh;
		}
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

	Widget _buildTextContent(int index, String text) {
		return TextView().buildText(
			text: text == null || text == 'null' ? '' : text,
			style: TextStyle(
				fontSize: FontSize.body1,
				color: index == 7 ? ColorRes.red : ColorRes.black
			)
		);
	}

	Widget _buildText(String text, TextStyle style){
		return TextView().buildText(
			text: text,
			style: style
		);
	}

	Widget _buildTextKh(int index, String text) {
		return TextView().buildText(
			text: text == null || text == 'null' ? '' : text,
			style: TextStyle(
				fontSize: FontSize.body3,
				color: index == 7 ? ColorRes.red : ColorRes.black
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
		  	        _buildTextContent(index, _getDayEn(rdbDate)),
		  	      ],
		  	    ),
		  	    Row(
		  		    mainAxisAlignment: MainAxisAlignment.center,
		  	      children: <Widget>[
		  	        _buildTextKh(index, _getDayKh(rdbDate)),
		  	        SizedBox(width: NumberRes.padding3),
		  	        _buildTextKh(index, _getKr(rdbDate)),
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

	bool _isToday(RDBDate rdbDate) {
		if(rdbDate == null || _getDayEn(rdbDate) == null){
			return false;
		}

		return DateTime.now().year.toString() == _getYYEn(rdbDate) &&
			DateTime.now().month.toString() == _getMMEn(rdbDate) &&
			DateTime.now().day.toString() == _getDayEn(rdbDate);
	}

	void _generateCalendarKh() {
		RDBCalendar rdbCalendar = new RDBCalendar();
		DateTime lastDayOfMonth = new DateTime(_currentYY, _currentMM + 1, 0);
		Map<int, RDBDate> weekDay1 = new Map();

		for(int i = 1; i <= lastDayOfMonth.day; i++){
			DateTime date = new DateTime(_currentYY, _currentMM, i);
			int dayNr = (date.weekday + 6) % 7;
			Map khmerDate = rdbCalendar.getKhmerLunarString(date);
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

	void _onSetState(){
		if(!mounted){
			return;
		}

		setState(() {});
	}
}
