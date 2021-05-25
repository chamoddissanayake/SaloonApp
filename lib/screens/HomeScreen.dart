import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/CarouselWidget.dart';
import 'package:saloon_app/screens/MapScreen.dart';
import 'package:saloon_app/widgets/LocationsFloatingActionWidget.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/models/Categories.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/commons/TrendingStyles.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TrendingStyles> mTrendingStyles;
  List<Categories> mCategories;

  @override
  void initState() {
    super.initState();
    mTrendingStyles = getTrendingStyles();
    mCategories = getCategories();
  }

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
        child: Container(
          child: Column(
            children: [
              Text(""),
              CarouselWidget(),
              Text(""),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    customTitleSeeAllWidget("Trending Styles", fontSize:  18.0, fontWeight: FontWeight.bold),
                    customTitleSeeAllWidget("See All >>", textColor: Colors.grey)
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mTrendingStyles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {

                      return trendingStyles(mTrendingStyles[index], index);
                    }),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       customTitleSeeAllWidget(t7_popular_hotels, fontFamily: fontMedium),
              //       text(t7_see_all, textColor: t7textColorSecondary)
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.5,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: mListings1.length,
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {
              //         return hotels(mListings1[index], index);
              //       }),
              // ),




            ],
          ),
        ),
      ),
      floatingActionButton: LocationsFloatingActionWidget(),
    );
  }
}
