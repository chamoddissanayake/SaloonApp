import 'package:flutter/material.dart';
import 'package:saloon_app/screens/IntroScreen.dart';
import 'package:saloon_app/screens/MainScreen.dart';
import 'package:saloon_app/screens/MapScreen.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = '/loading';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      // Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo/logo.png',
                  fit: BoxFit.fill,
                  width: 315,
                  height: 168,
                ),

                Image.asset(
                  "assets/images/loading/spinner-200px.gif",
                  height: 75.0,
                  width: 75.0,
                ),

                // Image.asset(
                //   "assets/images/loading/scissor.gif",
                //   height: 75.0,
                //   width: 75.0,
                // )
                // DotLoader()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
