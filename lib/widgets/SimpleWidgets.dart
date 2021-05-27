import 'package:flutter/material.dart';

BoxDecoration boxDecoration(
    {double radius = 2,
      Color color = Colors.transparent,
      Color bgColor = Colors.white,
      var showShadow = false,
      completeStatusIndex
    }) {
   Color finalColor =(completeStatusIndex==0)? Colors.lightGreen.shade200:(completeStatusIndex==1)? Colors.lightBlue.shade200:(completeStatusIndex==2)? Colors.redAccent.shade100: Colors.redAccent.shade100;
   print(finalColor);
   return BoxDecoration(

    color: finalColor ,
    boxShadow: showShadow
        ? [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 2)]
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}