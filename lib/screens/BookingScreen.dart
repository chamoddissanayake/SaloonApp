import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/LocationsFloatingActionWidget.dart';


class BookingScreen extends StatefulWidget {
  static const routeName = '/booking';
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
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
      body: Column(
        children: [
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),
          Text("Booking"),

        ],
      ),
      floatingActionButton: LocationsFloatingActionWidget(),
    );
  }
}
