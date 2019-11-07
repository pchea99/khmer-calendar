import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rdb_calendar/widget/text-view.dart';

class AppBarView{
	Widget buildAppBar({
		BuildContext context,
		String title,
		Widget action
	}){
		return AppBar(
			title: TextView().buildText(
				text: title,
				style: Theme.of(context).textTheme.title
			),
			actions: <Widget>[
				action
			],
		);
	}
}