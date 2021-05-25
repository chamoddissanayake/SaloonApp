import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';

class OffersScreen extends StatefulWidget {
  static const routeName = '/offers';
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
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
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
          Text("Offers"),
        ],
      ),
    );
  }
}
