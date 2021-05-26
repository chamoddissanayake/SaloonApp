import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';

class AllTrendingStyles extends StatefulWidget {
  static const routeName = '/all_trending_styles';
  @override
  _AllTrendingStylesState createState() => _AllTrendingStylesState();
}

class _AllTrendingStylesState extends State<AllTrendingStyles> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customTextWidget("All Trending Styles", fontSize:  20.0, fontWeight: FontWeight.bold),
                  Text("Sort By"),
                ],
              ),
            ),
            
            Text("sasa"),
            Text("sasa"),
            Text("sasa"),
            Text("sasa"),
            Text("sasa"),
            Text("sasa"),
          ],
        ),
      ),
    );
  }
}
