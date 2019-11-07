class Month{
	Map<String, Map> month;
	Map<String, Map> other;

	Month(){
		month = new Map();
		other = new Map();
	}

	Map getHoliday(String mName){
		return month[mName.toLowerCase()];
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
			return !month[mName.toLowerCase()].keys.contains("no");
		}catch(e){
			return false;
		}
	}

	List<String> _getNumDayHoliday(String mName){
		Set<String> numDays = new Set();
		month[mName.toLowerCase()].keys.forEach((k){
			k.toString().split("-").forEach((text){
				numDays.add(text);
			});
		});

		return numDays.toList();
	}

	@override
	String toString() {
		return 'Month{month: $month}';
	}
}