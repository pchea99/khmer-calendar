import 'package:flutter/material.dart';
import 'package:rdb_calendar/widget/appbar-view.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
	  return Scaffold(
		  appBar: AppBarView().buildAppBar(
			  title: 'ទំនាក់ទំនង',
			  isTitleCenter: true
		  ),
		  body: Container(
			  child: Text('Contact Us'),
		  ),
	  );
  }
}
