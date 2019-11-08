import 'package:rdb_calendar/util/string-field.dart';

class Month{
	Map<String, Map> holiday;
	Map<String, Map> other;

	Month(){
		holiday = new Map();
		other = new Map();
	}

	Map getHoliday(String mName){
		return holiday[mName.toLowerCase()];
	}

	bool isHoliday(String mName, String numDay){
		try{
			if(_isMHasHoliday(mName)){
				return _getNumDayHoliday(mName).contains(numDay);
			}else{
				return false;
			}
		} catch(e){
			return false;
		}
	}

	bool _isMHasHoliday(String mName){
		try{
			return !holiday[mName.toLowerCase()].keys.contains("no");
		}catch(e){
			return false;
		}
	}

	List<String> _getNumDayHoliday(String mName){
		Set<String> numDays = new Set();
		holiday[mName.toLowerCase()].keys.forEach((k){
			k.toString().split("-").forEach((text){
				numDays.add(text);
			});
		});

		return numDays.toList();
	}

	Month.fromJson(Map data){
		holiday = Map.from(data[StringField.holiday]);
		other = Map.from(data[StringField.other]);
	}

	Map toJson(){


		return{
			StringField.holiday: holiday,
			StringField.other: other,
		};
	}

	@override
	String toString() {
		return 'Month{month: $holiday, other: $other}';
	}
}