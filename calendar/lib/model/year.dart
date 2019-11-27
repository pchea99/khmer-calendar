import 'package:rdb_calendar/model/month.dart';

class Year{
	Map<String, Month> month;

	Year(){
		month = {};
	}

	Year.fromJson(Map data){
		month = {};
		data.forEach((k, v){
			Month m = Month.fromJson(v);
			month[k] = m;
		});
	}

	Month getMonth(int year){
		return month[year.toString()];
	}

	Map toJson(){
		Map toJson = {};
		month.forEach((k, v){
			toJson[k] = v.toJson();
		});

		return toJson;
	}

	@override
	String toString() {
		return 'Year{Year: $month}';
	}
}