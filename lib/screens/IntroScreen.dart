import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:saloon_app/screens/LoginSignUpScreen.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/intro';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  double heightWidth = 285.0;

  @override
  void initState() {
    super.initState();


  }

  @override
  void didChangeDependencies() {
    heightWidth = MediaQuery.of(context).size.height / 3;
    print(heightWidth);
    super.didChangeDependencies();
  }



  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        bubble: Image.asset('assets/images/intro/all/feature.png'),
        body: Text(
          'We provide hair-cutting, colouring and styling nail treatments, facials and skin care treatments etc.',
        ),
        title: Text(
          'Any Service',
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/images/intro/all/multi.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/images/intro/both/unisex.png',
      body: Text(
        'We provide our service for both men and women',
      ),
      title: Text('UniSex'),
      mainImage: Image.asset(
        'assets/images/intro/both/both.jpg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/images/intro/child/girl.png',
      body: Text(
        'We have special hair cuts for children with extra care.',
      ),
      title: Text('Children'),
      mainImage: Image.asset(
        'assets/images/intro/child/child.jpg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/images/intro/hygiene/soap.png',
      body: Text(
        'Due to the current pandemic of Covid-19, we take the first priority for health',
      ),
      title: Text('Covid-19'),
      mainImage: Image.asset(
        'assets/images/intro/hygiene/covid.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF0EB2FF),
      iconImageAssetPath: 'assets/images/intro/staff/steward.png',
      body: Text(
        'We have highly qualified staff',
      ),
      title: Text('Qualified staff'),
      mainImage: Image.asset(
        'assets/images/intro/staff/all.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Builder(
      builder: (context) => IntroViewsFlutter(
        pages,
        showNextButton: true,
        showBackButton: true,
        showSkipButton: true,
        onTapDoneButton: () {
          Navigator.pushReplacementNamed(
              context,
              LoginSignupScreen.routeName
          );
        },onTapSkipButton: (){
          Navigator.pushReplacementNamed(
              context,
              LoginSignupScreen.routeName
          );
      },
        pageButtonTextStyles: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ),);

  }
}
