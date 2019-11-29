import 'dart:convert';

import 'package:rdbCalendar/model/year.dart';
import 'package:rdbCalendar/util/string-field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
	static SharedPreferences _sharedPref;

	static Future init() async {
		_sharedPref = await SharedPreferences.getInstance();
	}

	static void setPref(Year year){
		String encode = json.encode(year.toJson());
		_sharedPref.setString(StringField.keySharedPref, encode);
	}

	static Year getPref(){
		try {
			Map decode = json.decode(_sharedPref.get(StringField.keySharedPref));
			Year year = Year.fromJson(decode);
			return year;
		}catch(e){
			return null;
		}
	}
}