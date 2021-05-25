import 'package:flutter/material.dart';

class TrendingStylesScreen extends StatefulWidget {
  static const routeName = '/trending_styles';
  @override
  _TrendingStylesScreenState createState() => _TrendingStylesScreenState();
}

class _TrendingStylesScreenState extends State<TrendingStylesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),

      ),
    );
  }
}
