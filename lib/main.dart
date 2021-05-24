import 'package:flutter/material.dart';
import 'package:saloon_app/screens/IntroScreen.dart';
import 'package:saloon_app/screens/LoadingScreen.dart';
import 'package:saloon_app/screens/LoginSignUpScreen.dart';
import 'package:saloon_app/screens/PhoneNumberInputScreen.dart';
import 'package:saloon_app/screens/VerificationInputScreen.dart';
import 'package:saloon_app/screens/MapScreen.dart';
import 'package:saloon_app/tools/tools.dart';

import 'models/markerModel.dart';

void main() {
  Tools.markersList.add(MarkersModel(
      1,
      "La Grande Poste",
      "The Algiers central post office is an office building for postal services located at Alger Centre municipality in Algiers, Algeria",
      "36.752887",
      "3.042048",
      "https://www.dzbreaking.com/wp-content/uploads/2018/03/2000.png"));
  Tools.markersList.add(MarkersModel(
      2,
      "Mosquee Ketchaoua",
      "The Ketchaoua Mosque is a mosque in Algiers, the capital of Algeria. It was built during the Ottoman rule in the 17th century and is located at the foot of the Casbah, which is a UNESCO World Heritage Site",
      "36.7850",
      "3.0608",
      "https://ttnotes.com/images/makam-echahid-algiers.jpg"));
  Tools.markersList.add(MarkersModel(
      3,
      "The shrine of the martyr",
      "The Maqam Echahid is a concrete monument commemorating the Algerian war for independence. The monument was opened in 1982 on the 20th anniversary of Algeria's independence",
      "36.7456",
      "3.0698",
      "https://www.airfrance.co.uk/GB/common/common/img/tbaf/news/ALG/la-mosquee-ketchaoua-l-histoire-avec-un-grand-h/ALG-la-mosquee-ketchaoua-l-histoire-avec-un-grand-h-2_1-1024x512.jpg"));


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
        '/phone_number_input': (context) => PhoneNumberInputScreen(),
        '/pin_verification': (context) => VerificationInputScreen(),
        '/map': (context) => MapScreen(),
      },
    );
  }
}