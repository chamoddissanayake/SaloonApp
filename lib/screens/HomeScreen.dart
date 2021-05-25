import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/CarouselWidget.dart';
import 'package:saloon_app/screens/MapScreen.dart';
import 'package:saloon_app/widgets/LocationsFloatingActionWidget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child:AppBarWidget() ,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(child: MainDrawer()),
      ),

      body: Container(
        child: Column(
          children: [
            Text(""),
            CarouselWidget()

          ],
        ),
      ),
      floatingActionButton: LocationsFloatingActionWidget(),
    );
  }
}
