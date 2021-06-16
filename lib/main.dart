import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saloon_app/screens/AllTrendingStyles.dart';
import 'package:saloon_app/screens/BookingScreen.dart';
import 'package:saloon_app/screens/IntroScreen.dart';
import 'package:saloon_app/screens/LoadingScreen.dart';
import 'package:saloon_app/screens/LoginSignUpScreen.dart';
import 'package:saloon_app/screens/PhoneNumberInputScreen.dart';
import 'package:saloon_app/screens/TrendingStylesScreen.dart';
import 'package:saloon_app/screens/VerificationInputScreen.dart';
import 'package:saloon_app/screens/MapScreen.dart';
import 'package:saloon_app/screens/MainScreen.dart';


import 'package:saloon_app/screens/HomeScreen.dart';
import 'package:saloon_app/screens/FavouritesScreen.dart';
import 'package:saloon_app/screens/OffersScreen.dart';
import 'package:saloon_app/screens/SearchScreen.dart';
import 'package:saloon_app/screens/AllCategories.dart';

import 'package:saloon_app/screens/StyleScreen.dart';
import 'package:saloon_app/screens/PaymentScreen.dart';
import 'package:saloon_app/screens/ProfileScreen.dart';
import 'package:saloon_app/screens/SingleCategoryScreen.dart';

import 'package:saloon_app/tools/tools.dart';

import 'models/markerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {

    await Firebase.initializeApp();
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saloon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        // primaryColor:Color.fromRGBO(250, 250, 250, 1),
        // primarySwatch: Colors.yellow,

      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/loading': (context) => LoadingScreen(),
        '/intro': (context) => IntroScreen(),
        '/login_sign_up': (context) => LoginSignupScreen(),
        '/phone_number_input': (context) => PhoneNumberInputScreen(),
        '/map': (context) => MapScreen(),
        '/pin_verification': (context) => VerificationInputScreen(),
        '/main': (context) => MainScreen(),
        '/home': (context) => HomeScreen(),
        '/booking': (context) => BookingScreen(bookingTypeFromConstructor:1),
        '/favourites': (context) => FavouritesScreen(),
        '/offers': (context) => OffersScreen(),
        '/trending_styles': (context) => TrendingStylesScreen(),
        '/search': (context) => SearchScreen(),
        '/all_trending_styles': (context) => AllTrendingStyles(),
        '/all_categories': (context) => AllCategories(),
        '/style': (context) => StyleScreen(),
        '/payment': (context) => PaymentScreen(),
        '/profile': (context) => ProfileScreen(),
        '/single_category': (context) => SingleCategoryScreen(),




      },
    );
  }
}