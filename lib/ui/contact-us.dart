import 'package:flutter/material.dart';
import 'package:rdbCalendar/res/number.dart';
import 'package:rdbCalendar/res/string.dart';
import 'package:rdbCalendar/widget/appbar-view.dart';
import 'package:rdbCalendar/widget/image-logo.dart';

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
		  body: SingleChildScrollView(
			  child: Container(
				  margin: EdgeInsets.all(NumberRes.padding8),
				  child: _buildBody(),
			  ),
		  )
	  );
  }

  Widget _buildBody() {
	  return Column(
		  crossAxisAlignment: CrossAxisAlignment.center,
		  children: <Widget>[
			  ImageLogo().imageLogo(),
			  Text(
				  "អគារលេខ 9-13 ផ្លូវលេខ7 សង្កាត់ចតុមុខ ប្រអប់សំបុត្រលេខ 1410 ភ្នំពេញ កម្ពុជា",
				  textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
			  ),
			  SizedBox(height: NumberRes.padding8),
			  Column(
				  mainAxisAlignment: MainAxisAlignment.start,
				  children: <Widget>[
            _buildRowView("Phone", "(855) 23 220 810 / 811"),
            _buildRowView("Fax", "(855) 23 224 628"),
            _buildRowView("Email", "admin@ardb.com.kh"),
            _buildRowView("Website", "www.ardb.com.kh"),
            _buildRowView("FB", "Agricultural And Rural Development Bank of Cambodia"),
            _buildRowView("Youtube", "Agricultural And Rural Development Bank"),
            _buildRowView("Linkedin", "Agricultural And Rural Development Bank (ARDB)"),
				  ],
			  )
		  ],
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
				  child: Text(
            lbl,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15
            ),
          ),
				  flex: 2,
			  ),
			  Expanded(
				  child: Text(":"),
				  flex: 1,
			  ),
			  Expanded(
				  child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15
            ),
          ),
				  flex: 8,
			  ),
		  ]
	    ),
	  );
  }
}
