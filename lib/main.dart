import 'package:flutter/material.dart';
import 'package:saloon_app/screens/IntroScreen.dart';
import 'package:saloon_app/screens/LoadingScreen.dart';
import 'package:saloon_app/screens/LoginSignUpScreen.dart';
import 'package:saloon_app/screens/PhoneNumberInputScreen.dart';


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
        // primarySwatch: Colors.lightGreen,
        primarySwatch:Colors.lightBlue

      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/intro': (context) => IntroScreen(),
        '/login_sign_up': (context) => LoginSignupScreen(),
        '/phone_number_input': (context) => PhoneNumberInputScreen()

      },
    );
  }
}