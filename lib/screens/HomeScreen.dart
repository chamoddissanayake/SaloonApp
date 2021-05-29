import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/screens/AllCategories.dart';
import 'package:saloon_app/screens/AllTrendingStyles.dart';
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
import 'package:saloon_app/commons/Categories.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Categories> mCategories;

  HomeScreenState() {}

  @override
  void initState() {
    super.initState();
    mCategories = getCategories();
  }

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
                    customTitleSeeAllWidget("Trending Styles",
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    GestureDetector(
                      child: customTitleSeeAllWidget("See All >>",
                          textColor: Colors.grey),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new AllTrendingStyles()));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FutureBuilder<List<TrendingStyles>>(
                  future: getTrendingStyles(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TrendingStyles>> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.5,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      print("-------");
                                      snapshot.data[index];
                                      print("-------");
                                  },
                                    child: trendingStyles(
                                        snapshot.data[index], index),
                                  );
                                }))
                      ];
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        )
                      ];
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          child: CircularProgressIndicator(),
                          width: 60,
                          height: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting result...'),
                        )
                      ];
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    customTitleSeeAllWidget("Categories",
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    GestureDetector(
                      child: customTitleSeeAllWidget("See All >>",
                          textColor: Colors.grey),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new AllCategories()));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mCategories.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return categories(mCategories[index], index);
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: LocationsFloatingActionWidget(),
    );
  }
}
