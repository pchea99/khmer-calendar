import 'dart:async';

import 'package:connectivity/connectivity.dart';

class CheckConnection{
	Future checkConnection() async {
		Completer completer = new Completer();
		bool isConnected = false;
		var connectivityResult = await (Connectivity().checkConnectivity());
		if (connectivityResult == ConnectivityResult.mobile) {
			isConnected = true;
		} else if (connectivityResult == ConnectivityResult.wifi) {
			isConnected = true;
		}
		completer.complete(isConnected);
		return completer.future;
	}
}