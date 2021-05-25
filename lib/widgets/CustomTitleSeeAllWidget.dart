import 'package:flutter/material.dart';

Widget customTitleSeeAllWidget(String text, {var fontSize = 16.0, textColor = Colors.black,  // var fontFamily = 'Regular',
      var isCentered = false, var maxLine = 1, var latterSpacing = 0.25,    var textAllCaps = false,  var isLongText = false,  var fontWeight = FontWeight.normal}) {

  return Text(textAllCaps ? text.toUpperCase() : text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      style: TextStyle(
          // fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
          height: 1.5,
          letterSpacing: latterSpacing));
}