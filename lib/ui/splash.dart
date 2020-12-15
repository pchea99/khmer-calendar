import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rdbCalendar/core/config.dart';
import 'package:rdbCalendar/service/service.dart';
import 'package:rdbCalendar/shared-pref/shared-pref.dart';
import 'package:rdbCalendar/ui/home.dart';
import 'package:rdbCalendar/ui/no-connection.dart';
import 'package:rdbCalendar/util/check-connection.dart';
import 'package:rdbCalendar/util/generate-data.dart';
import 'package:rdbCalendar/util/logging.dart';
import 'package:rdbCalendar/util/navigate.dart';

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
			GenerateData().createData(2021);
		}
	}

  @override
  Widget build(BuildContext context) {
    return Container(
	    child: Image.asset(
		    'assets/images/rdb_calendar.jpg',
		    fit: BoxFit.fill,
	    ),
    );
  }

  Future _init() async {
	  _getData();
	  await SharedPref.init();
	  if(SharedPref.getPref() == null){
		  CheckConnection().checkConnection().then((isConnected){
			  if(isConnected){
				  _getMonth();
			  }else{
				  Navigate.pushAndRemoveUntil(context, NoConnection());
			  }
		  });
	  }else{
	  	Future.delayed(Duration(seconds: 2), (){
			  _navigateTo();
		  });
	  }
  }

  void _navigateTo() {
    Navigate.pushAndRemoveUntil(context, Home());
  }

	Future _getMonth() async {
		await ServiceFS().getMonth().then((data){
			SharedPref.setPref(data);
			_navigateTo();
		}).catchError((e){
			Navigate.pushAndRemoveUntil(context, NoConnection());
			Logging.logWarning(e.toString());
		});
	}

	Future _getData() async {
		await ServiceFS().getMonth().then((data){
		  if(data != null) {
        SharedPref.setPref(data);
      }
		}).catchError((e){
			Navigate.pushAndRemoveUntil(context, NoConnection());
			Logging.logWarning(e.toString());
		});
	}
}
