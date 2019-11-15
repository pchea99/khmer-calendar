import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rdb_calendar/model/month.dart';
import 'package:rdb_calendar/util/logging.dart';

class ServiceFS {
	Future<Month> getMonth(){
		Completer completer = new Completer<Month>();
		Month calendar = new Month();
		Logging.logInfo("read collection months");
		Firestore.instance.collection('calendar').getDocuments().then((snap){
			if(snap.documents != null && snap.documents.isNotEmpty) {
				snap.documents.forEach((doc) {
					print("--- ${doc.data}");
					calendar.holiday[doc.documentID] = doc.data['holiday'];
					if(doc.data['other'] != null && doc.data['other'].isNotEmpty){
						calendar.other[doc.documentID] = doc.data['other'];
					}
				});
				Logging.logInfo("read collection months completed $calendar");
				completer.complete(calendar);
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