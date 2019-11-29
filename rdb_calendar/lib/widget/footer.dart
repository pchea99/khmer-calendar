import 'package:flutter/cupertino.dart';
import 'package:rdbCalendar/core/config.dart';
import 'package:rdbCalendar/model/month.dart';
import 'package:rdbCalendar/res/color.dart';
import 'package:rdbCalendar/res/fontsize.dart';
import 'package:rdbCalendar/res/number.dart';
import 'package:rdbCalendar/widget/text-view.dart';

class Footer{
	Widget buildFooter(Month month, int currentMM){
		return Container(
			margin: EdgeInsets.symmetric(horizontal: NumberRes.padding8),
			padding: EdgeInsets.symmetric(vertical: NumberRes.padding8),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					_buildListOther(month, currentMM),
					_buildListHoliday(month, currentMM),
				],
			),
		);
	}

	Widget _buildListOther(Month month, int currentMM){
		try {
			var other = month.other[getMonthEn[currentMM].toString().toLowerCase()];
			if (other == null || other.isEmpty) {
				return Container();
			}
			var entries = other.entries.toList()
				..sort((l, r) =>
					l.value['index'].toString().compareTo(r.value['index'].toString()));

			return Container(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.start,
					children: entries.map((e) =>
						_buildFooter(
							e.key, other[e.key]['kh'], other[e.key]['en'], ColorRes.blue)
					).toList(),
				),
			);
		}catch (e){
			return Container();
		}
	}

	Widget _buildFooter(String numDay, String textKh, String textEn, Color color) {
		return Container(
			padding: EdgeInsets.only(top: NumberRes.padding6),
			child: Row(
		  	crossAxisAlignment: CrossAxisAlignment.start,
		  	mainAxisAlignment: MainAxisAlignment.start,
		  	children: <Widget>[
		  		_buildText(
		  			numDay,
		  			_textStyleList(color)
		  		),
		  		SizedBox(width: NumberRes.padding8),
		  		Expanded(
		  		  child: SingleChildScrollView(
		  		  	scrollDirection: Axis.horizontal,
		  		    child: Container(
		  					margin: EdgeInsets.only(right: NumberRes.width110),
		  		      child: _buildText(
		  		      	textKh +" / "+  textEn,
		  		      	_textStyleList(color)
		  		      ),
		  		    ),
		  		  ),
		  		),
		  	],
		  ),
		);
	}

	TextStyle _textStyleList(Color color) {
		return TextStyle(
			fontSize: FontSize.subtitle,
			color: color
		);
	}

	Widget _buildListHoliday(Month month, int currentMM){
		try {
			var holiday = month.holiday[getMonthEn[currentMM]
				.toString()
				.toLowerCase()];
			if (holiday == null || holiday.isEmpty) {
				return Container();
			}
			var entries = holiday.entries.toList()
				..sort((l, r) =>
					l.value['index'].toString().compareTo(r.value['index'].toString()));

			return Container(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.start,
					children: entries.map((e) =>
						_buildFooter(
							e.key, holiday[e.key]['kh'], holiday[e.key]['en'], ColorRes.red)
					).toList(),
				),
			);
		}catch(e){
			return Container();
		}
	}

	Widget _buildText(String text, TextStyle style){
		return TextView().buildText(
			text: text,
			style: style
		);
	}
}