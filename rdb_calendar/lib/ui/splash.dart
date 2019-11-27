import 'package:flutter/material.dart';
import 'package:rdb_calendar/core/config.dart';
import 'package:rdb_calendar/res/color.dart';
import 'package:rdb_calendar/res/number.dart';
import 'package:rdb_calendar/service/service.dart';
import 'package:rdb_calendar/shared-pref/shared-pref.dart';
import 'package:rdb_calendar/ui/home.dart';
import 'package:rdb_calendar/ui/no-connection.dart';
import 'package:rdb_calendar/util/check-connection.dart';
import 'package:rdb_calendar/util/generate-data.dart';
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
		if(isGenerate) {
			GenerateData().createData(2020);
		}
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
		  CheckConnection().checkConnection().then((isConnected){
			  if(isConnected){
				  _getMonth();
			  }else{
				  Navigate.removeUntil(context, NoConnection());
			  }
		  });
	  }else{
	  	Future.delayed(Duration(seconds: 2), (){
			  _navigateTo();
		  });
	  }
  }

  void _navigateTo() {
    Navigate.removeUntil(context, Home());
  }

	Future _getMonth() async {
		await ServiceFS().getMonth().then((data){
			SharedPref.setPref(data);
			_navigateTo();
		}).catchError((e){
			Navigate.removeUntil(context, NoConnection());
			Logging.logWarning(e.toString());
		});
	}
}
