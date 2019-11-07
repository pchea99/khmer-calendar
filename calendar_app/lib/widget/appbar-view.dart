import 'package:calendar_app/widget/text-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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