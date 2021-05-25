import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/screens/TrendingStylesScreen.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';

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

      body: Center(
        child: ElevatedButton(
          child: Text('Test Button'),
          onPressed: () {
            print("Button pressed.");
            // Navigate to second route when tapped.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrendingStylesScreen()),
            );
          },
        ),
      ),
    );
  }
}
