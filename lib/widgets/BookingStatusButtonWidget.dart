import 'package:flutter/material.dart';

import 'CustomTextWidget.dart';

Widget bookingStatusButtonWidget(
  String btnTitle, {
  var btnColor = Colors.blue,
  var btnFontSize = 16.0,
  var btnFontWeight = FontWeight.normal,
}) {

  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
    decoration: new BoxDecoration(
      color: btnColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(15),
    ),
    alignment: Alignment.center,
    child: customTextWidget(btnTitle,
        textColor: Colors.white, fontSize: btnFontSize, fontWeight: btnFontWeight),
    // child: Text("aaa"),
  );
}
