import 'package:flutter/material.dart';

Widget customBackIcon(var color, var icon, var iconColor) {
  return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: Icon(icon, color: iconColor));
}
