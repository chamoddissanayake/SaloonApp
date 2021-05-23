import 'package:flutter/material.dart';
import 'package:saloon_app/screens/IntroScreen.dart';
import 'package:saloon_app/screens/LoadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saloon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/intro': (context) => IntroScreen(),
      },
    );
  }
}