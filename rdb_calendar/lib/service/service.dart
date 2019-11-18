import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rdb_calendar/model/month.dart';
import 'package:rdb_calendar/model/year.dart';
import 'package:rdb_calendar/util/logging.dart';

class ServiceFS {
	Future<Year> getMonth(){
		Completer completer = new Completer<Year>();
		Year year = new Year();
		Logging.logInfo("read collection months");
		Firestore.instance.collection('calendar').getDocuments().then((snap){
			if(snap.documents != null && snap.documents.isNotEmpty) {
				snap.documents.forEach((doc) {
					Month month = new Month();
					doc.data.forEach((k, v){
						month.holiday[k] = v['holiday'];
						if(v['other'] != null && v['other'].isNotEmpty){
							month.other[k] = v['other'];
						}
					});
					year.month[doc.documentID] = month;
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
		Firestore.instance.document('calendar/' + key)
			.setData(Map.from(data))
			.catchError((e){
				Logging.logError(e.toString());
			});
	}
}