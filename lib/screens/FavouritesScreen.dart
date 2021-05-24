import 'package:flutter/material.dart';

class FavouritesScreen extends StatefulWidget {
  static const routeName = '/favourites';
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
