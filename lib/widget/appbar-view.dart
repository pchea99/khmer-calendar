import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rdbCalendar/res/fontsize.dart';
import 'package:rdbCalendar/widget/text-view.dart';

class AppBarView{
	Widget buildAppBar({
		BuildContext context,
		String title,
		bool isTitleCenter,
		Widget action
	}){
		return AppBar(
			title: TextView().buildText(
				text: title,
				style: TextStyle(
					fontSize: FontSize.headline,
				)
			),
			centerTitle: isTitleCenter == null ? false : isTitleCenter,
			actions: <Widget>[
				action == null ? Container() : action
			],
		);
	}
}