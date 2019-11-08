import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rdb_calendar/model/month.dart';

class ServiceFirestore {
	Future<Month> getMonth(){
		Completer completer = new Completer<Month>();
		Month month = new Month();
		Firestore.instance.collection('months').getDocuments().then((snap){
			if(snap.documents != null && snap.documents.isNotEmpty) {
				snap.documents.forEach((doc) {
					month.month[doc.documentID] = doc.data['holiday'];
					if(doc.data['other'] != null && doc.data['other'].isNotEmpty){
						month.other[doc.documentID] = doc.data['other'];
					}
				});
				completer.complete(month);
			}
		});

		return completer.future;
	}
}