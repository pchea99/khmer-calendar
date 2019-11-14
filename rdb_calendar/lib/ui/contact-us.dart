import 'package:flutter/material.dart';
import 'package:rdb_calendar/res/number.dart';
import 'package:rdb_calendar/res/string.dart';
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
			  title: StringRes.contactUs,
			  isTitleCenter: true
		  ),
		  body: Container(
			  margin: EdgeInsets.all(NumberRes.padding8),
			  child: Column(
				  crossAxisAlignment: CrossAxisAlignment.start,
			    children: <Widget>[
				    Text(
					    "អគារលេខ 9-13 ផ្លូវលេខ7 សង្កាត់ចតុមុខ ប្រអប់សំបុត្រលេខ 1410 ភ្នំពេញ កម្ពុជា",
					    textAlign: TextAlign.center,
				    ),
				    SizedBox(height: NumberRes.padding8),
				    _buildRowView("Phone", "(855) 23 220 810 / 811"),
				    _buildRowView("Fax", "(855) 23 224 628"),
				    _buildRowView("Email", "admin@rdb.com.kh"),
				    _buildRowView("Website", "www.rdb.com.kh"),
				    _buildRowView("FB", "Rural Development Bank of Cambodia"),
				    _buildRowView("Youtube", "Rural Development Bank"),
				    _buildRowView("Linkedin", "Rural Development Bank (RDB)"),
			    ],
			  ),
		  )
	  );
  }

  Widget _buildRowView(String lbl, String value) {
	  return Container(
		  margin: EdgeInsets.only(
			  top: NumberRes.padding6,
		  ),
	    child: Row(
		  children: <Widget>[
			  Expanded(
				  child: Text(lbl),
				  flex: 2,
			  ),
			  Expanded(
				  child: Text(":"),
				  flex: 1,
			  ),
			  Expanded(
				  child: Text(value),
				  flex: 8,
			  ),
		  ]
	    ),
	  );
  }
}
