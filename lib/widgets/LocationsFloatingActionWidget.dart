import 'package:flutter/material.dart';
import 'package:saloon_app/screens/MapScreen.dart';

class LocationsFloatingActionWidget extends StatefulWidget {
  @override
  _LocationsFloatingActionWidgetState createState() => _LocationsFloatingActionWidgetState();
}

class _LocationsFloatingActionWidgetState extends State<LocationsFloatingActionWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child:  new Image.asset("assets/images/map/location.png" ,width: 35, height: 35,),
      tooltip: "Find Nearby saloons",
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed(MapScreen.routeName);
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) => new MapScreen())
        );
      },
    );
  }
}
