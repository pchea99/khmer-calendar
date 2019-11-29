import 'package:flutter/cupertino.dart';
import 'package:rdbCalendar/core/config.dart';
import 'package:rdbCalendar/model/month.dart';
import 'package:rdbCalendar/res/color.dart';
import 'package:rdbCalendar/res/fontsize.dart';
import 'package:rdbCalendar/res/number.dart';
import 'package:rdbCalendar/widget/text-view.dart';

class Footer{
	Widget buildFooter(Month month, int currentMM){
		return SingleChildScrollView(
			scrollDirection: Axis.horizontal,
			child: Container(
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
				padding: EdgeInsets.only(
					right: currentMM == 7 ? 155.0 : currentMM == 2 ? 25.0 : 0.0
				),
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
		return Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				_buildText(
					numDay,
					_textStyleList(color)
				),
				SizedBox(width: NumberRes.padding8),
				_buildText(
					textKh +" / "+  textEn,
					_textStyleList(color)
				),
				SizedBox(width: NumberRes.width25),
			],
		);
	}

	TextStyle _textStyleList(Color color) {
		return TextStyle(
			fontSize: FontSize.body1,
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
				padding: EdgeInsets.only(
					right: currentMM == 3 ? 28.0 : currentMM == 9 ? 22.0 : 0.0
				),
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