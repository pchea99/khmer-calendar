import 'package:flutter/cupertino.dart';
import 'package:rdbCalendar/res/number.dart';

class ImageLogo{
	Widget imageLogo(){
		return Image.asset(
			'assets/images/rdb_logo.png',
			width: NumberRes.width235,
			height: NumberRes.width235,
		);
	}
}