import 'package:flutter/cupertino.dart';
import 'package:rdb_calendar/res/number.dart';

class ImageLogo{
	Widget imageLogo(){
		return Image.asset(
			'assets/images/rdb_logo.png',
			width: NumberRes.width235,
			height: NumberRes.width235,
		);
	}
}