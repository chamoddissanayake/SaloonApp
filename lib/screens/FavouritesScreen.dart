import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/LocationsFloatingActionWidget.dart';
import 'package:saloon_app/models/Favourite.dart';

import 'package:flutter/material.dart';

/*
* Bandara A.B.C.N
* IT18117356
* Favourite Screen
*/

class FavouritesScreen extends StatefulWidget {
  static const routeName = '/favourites';
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(child: MainDrawer()),
      ),
      body: Column(
        children: [
          Text("Favourites"),
          Text("Favourites"),
          Text("Favourites"),
          Text("Favourites"),
          Text("Favourites"),
          Text("Favourites"),
          Text("Favourites"),
          Text("Favourites"),
          Text("Favourites"),
          Text("Favourites"),
        ],
      ),
      floatingActionButton: LocationsFloatingActionWidget(),
    );
  }
}
