import 'package:flutter/material.dart';
import 'package:rdb_calendar/core/config.dart';
import 'package:rdb_calendar/res/fontsize.dart';
import 'package:rdb_calendar/res/number.dart';
import 'package:rdb_calendar/widget/text-view.dart';

class HeaderMMYY{
	Widget buildHeaderMMYY(Map dateOfMM, int firstWeek, int countWeek) {
		return Expanded(
			child: Column(
				children: <Widget>[
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							_buildTextMMKh(dateOfMM, firstWeek, countWeek),
							_buildTextMMEn(dateOfMM),
						],
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							_buildTextYYKh(dateOfMM, countWeek),
							_buildTextMMYYEn(dateOfMM),
						],
					),
				],
			),
		);
	}

	Widget _buildTextMMKh(Map dateOfMM, int firstWeek, int countWeek) {
		return _buildText(
			_getStartMMKh(dateOfMM, firstWeek) != _getEndMMKh(dateOfMM, countWeek)
				? _getStartMMKh(dateOfMM, firstWeek) +"-"+
					_getEndMMKh(dateOfMM, countWeek) +" ឆ្នាំ"+ dateOfMM[2][1].animalYY
				: _getStartMMKh(dateOfMM, firstWeek) +" ឆ្នាំ"+ dateOfMM[2][1].animalYY,
			TextStyle(
				fontSize: FontSize.subtitle,
				fontWeight: FontWeight.w500
			)
		);
	}

	Widget _buildTextMMEn(Map dateOfMM) {
		return _buildText(
			getMonthKh[dateOfMM[2][1].mmEn],
			TextStyle(
				fontSize: FontSize.subtitle,
				fontWeight: FontWeight.w500
			)
		);
	}

	Widget _buildTextYYKh(Map dateOfMM, int countWeek) {
		return Container(
			margin: EdgeInsets.only(right: NumberRes.padding12),
			child: _buildText(
				"ព.ស​ "+ dateOfMM[countWeek][1].yyKh,
				TextStyle(
					fontSize: FontSize.body1,
					fontWeight: FontWeight.w500
				)
			),
		);
	}

	Widget _buildTextMMYYEn(Map dateOfMM) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				_buildText(
					getMonthEn[dateOfMM[2][1].mmEn],
					TextStyle(
						fontSize: FontSize.body1,
						fontWeight: FontWeight.w500
					)
				),
				SizedBox(width: NumberRes.padding4),
				_buildText(
					dateOfMM[2][1].yyEn.toString(),
					TextStyle(
						fontSize: FontSize.body1,
						fontWeight: FontWeight.w500
					)
				),
			],
		);
	}

	Widget _buildText(String text, TextStyle style){
		return TextView().buildText(
			text: text,
			style: style
		);
	}

	String _getStartMMKh(Map dateOfMM, int firstWeek){
		if(dateOfMM[firstWeek][1] != null && dateOfMM[firstWeek][1].mmKh != null) {
			return dateOfMM[firstWeek][1].mmKh;
		} else if(dateOfMM[firstWeek][1] != null && dateOfMM[firstWeek][2].mmKh != null) {
			return dateOfMM[firstWeek][2].mmKh;
		} else if(dateOfMM[firstWeek][1] != null && dateOfMM[firstWeek][3].mmKh != null) {
			return dateOfMM[firstWeek][3].mmKh;
		}else if(dateOfMM[firstWeek][1] != null && dateOfMM[firstWeek][4].mmKh != null) {
			return dateOfMM[firstWeek][4].mmKh;
		}else if(dateOfMM[firstWeek][1] != null && dateOfMM[firstWeek][5].mmKh != null) {
			return dateOfMM[firstWeek][5].mmKh;
		}else if(dateOfMM[firstWeek][1] != null && dateOfMM[firstWeek][6].mmKh != null) {
			return dateOfMM[firstWeek][6].mmKh;
		}else {
			return dateOfMM[firstWeek][7].mmKh;
		}
	}

	String _getEndMMKh(Map dateOfMM, int countWeek){
		if(dateOfMM[countWeek][7] != null && dateOfMM[countWeek][7].mmKh != null) {
			return dateOfMM[countWeek][7].mmKh;
		} else if(dateOfMM[countWeek][6] != null && dateOfMM[countWeek][6].mmKh != null) {
			return dateOfMM[countWeek][6].mmKh;
		} else if(dateOfMM[countWeek][5] != null && dateOfMM[countWeek][5].mmKh != null) {
			return dateOfMM[countWeek][5].mmKh;
		}else if(dateOfMM[countWeek][4] != null && dateOfMM[countWeek][4].mmKh != null) {
			return dateOfMM[countWeek][4].mmKh;
		}else if(dateOfMM[countWeek][3] != null && dateOfMM[countWeek][3].mmKh != null) {
			return dateOfMM[countWeek][3].mmKh;
		}else if(dateOfMM[countWeek][2] != null && dateOfMM[countWeek][2].mmKh != null) {
			return dateOfMM[countWeek][2].mmKh;
		}else {
			return dateOfMM[countWeek][1].mmKh;
		}
	}
}