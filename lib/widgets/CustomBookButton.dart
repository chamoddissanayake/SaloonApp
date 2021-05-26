import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';

class CustomBookButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;
  Color bgColor = Colors.white;

  CustomBookButton({
    @required this.textContent,
    @required this.onPressed,
    @required this.bgColor,
  });

  @override
  CustomBookButtonState createState() => CustomBookButtonState();
}

class CustomBookButtonState extends State<CustomBookButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: customTextWidget(widget.textContent,
              textColor: widget.bgColor == Colors.white ? Colors.black : Colors.white,
              isCentered: true,
              textAllCaps: true),
          decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(25),
              // bgColor: widget.bgColor,
              // radius: 6
          )
      ),
    );
  }
}
