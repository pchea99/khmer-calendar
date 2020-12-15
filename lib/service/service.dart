import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rdbCalendar/model/month.dart';
import 'package:rdbCalendar/model/year.dart';
import 'package:rdbCalendar/util/logging.dart';

class ServiceFS {
	Future<Year> getMonth(){
		Completer completer = new Completer<Year>();
		Year year = new Year();
		Logging.logInfo("read collection months");
    FirebaseFirestore.instance.collection('calendar').get().then((snap){
			if(snap.docs != null && snap.docs.isNotEmpty) {
				snap.docs.forEach((doc) {
					Month month = new Month();
					doc.data().forEach((k, v){
						month.holiday[k] = v['holiday'];
						if(v['other'] != null && v['other'].isNotEmpty){
							month.other[k] = v['other'];
						}
					});
					year.month[doc.id] = month;
				});
				Logging.logInfo("read collection months completed $year");
				completer.complete(year);
			}else{
				completer.completeError(null);
				Logging.logWarning("read collection months no data");
			}
		}).catchError((e){
			completer.completeError(e);
			Logging.logError(e.toString());
		});

		return completer.future;
	}

	void createData(String key, Map data){
    FirebaseFirestore.instance.doc('calendar/' + key)
			.set(Map.from(data))
			.catchError((e){
				Logging.logError(e.toString());
			});
	}
}