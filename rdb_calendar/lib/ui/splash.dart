import 'package:flutter/material.dart';
import 'package:rdb_calendar/res/color.dart';
import 'package:rdb_calendar/res/number.dart';
import 'package:rdb_calendar/service/service.dart';
import 'package:rdb_calendar/shared-pref/shared-pref.dart';
import 'package:rdb_calendar/ui/home.dart';
import 'package:rdb_calendar/util/check-connection.dart';
import 'package:rdb_calendar/util/logging.dart';
import 'package:rdb_calendar/util/navigate.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

	@override
	void initState() {
		super.initState();
		_init();
	}

  @override
  Widget build(BuildContext context) {
    return Container(
	    padding: EdgeInsets.only(top: NumberRes.padding22),
	    color: ColorRes.white,
	    child: Image.asset(
		    'assets/images/rdb-calendar.png',
		    fit: BoxFit.fill,
	    ),
    );
  }

  Future _init() async {
	  await SharedPref.init();
	  if(SharedPref.getPref() == null){
	  	_getMonth().then((_){
			  _navigateTo();
		  });
	  }else{
	  	Future.delayed(Duration(seconds: 2), (){
			  _navigateTo();
		  });
	  }
	  CheckConnection().checkConnection().then((isConnected){
		  if(isConnected){
			  _getMonth();
		  }
	  });
  }

  void _navigateTo() {
    Navigate.removeUntil(context, Home());
  }

	Future _getMonth() async {
		await ServiceFS().getMonth().then((data){
			SharedPref.setPref(data);
		}).catchError((e){
			Logging.logWarning(e.toString());
		});
	}
}
