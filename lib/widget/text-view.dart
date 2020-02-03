import 'package:flutter/cupertino.dart';

class TextView{
	Widget buildText({
		String text,
		TextStyle style,
		TextAlign textAlign
	}){
		return Text(
			text,
			style: style,
			textAlign: textAlign,
		);
	}
}