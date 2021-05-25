import 'package:carousel_slider/carousel_slider.dart';
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
  final List<String> imagelist = [
    "https://i.imgur.com/zuG2bGQ.jpg",
    "https://i.imgur.com/zuG2bGQ.jpg",
    "https://i.imgur.com/zuG2bGQ.jpg",
    "https://i.imgur.com/zuG2bGQ.jpg",
    "https://i.imgur.com/zuG2bGQ.jpg"
  ];
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
        child: CarouselSlider(
          options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true
          ),
          items: imagelist.map((e) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(e,width: 1000,height: 200,fit: BoxFit.cover,)
              ],
            ),
          )).toList(),
        )
      ),
    );
  }
}
