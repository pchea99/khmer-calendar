import 'package:flutter/cupertino.dart';
import 'package:rdbCalendar/res/number.dart';

class ImageLogo{
	Widget imageLogo(){
		return Image.asset(
			'assets/images/rdb_logo.png',
			height: NumberRes.width235,
		);
	}
}