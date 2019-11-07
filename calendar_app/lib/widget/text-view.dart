import 'package:flutter/cupertino.dart';

class TextView{
	Widget buildText({
		String text,
		TextStyle style
	}){
		return Text(
			text,
			style: style,
		);
	}
}