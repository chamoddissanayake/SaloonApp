import 'package:flutter/material.dart';


class VerificationInputScreen extends StatefulWidget {
  static const routeName = '/pin_verification';

  @override
  _VerificationInputScreenState createState() => _VerificationInputScreenState();
}

class _VerificationInputScreenState extends State<VerificationInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
         
              Container(
                child: Column(
                  children: [
                    Text("666")
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
