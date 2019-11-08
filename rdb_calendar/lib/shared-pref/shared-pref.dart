import 'dart:convert';

import 'package:rdb_calendar/model/month.dart';
import 'package:rdb_calendar/util/string-field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
	static SharedPreferences _sharedPref;

	static Future init() async {
		_sharedPref = await SharedPreferences.getInstance();
	}

	static void setPref(Month month){
		String encode = json.encode(month.toJson());
		_sharedPref.setString(StringField.keySharedPref, encode);
	}

	static Month getPref(){
		Map decode = json.decode(_sharedPref.get(StringField.keySharedPref));
		Month month = Month.fromJson(decode);
		return month;
	}
}