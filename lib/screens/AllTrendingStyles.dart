import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/utils/PriceUtils.dart';
import 'package:saloon_app/widgets/ShowSortingDialog.dart';
import 'package:saloon_app/screens/StyleScreen.dart';
import 'package:saloon_app/utils/globals.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';

class AllTrendingStyles extends StatefulWidget {
  static const routeName = '/all_trending_styles';

  @override
  _AllTrendingStylesState createState() => _AllTrendingStylesState();
}

class _AllTrendingStylesState extends State<AllTrendingStyles> {
  // List<TrendingStyles> mTrendingStylesList;

  @override
  void initState() {
    super.initState();
    // mTrendingStylesList = getAllTrendingStyles();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 50;
    final Size cardSize = Size(width, width / 1.8);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(),
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
                  customTextWidget("All Trending Styles",
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                  GestureDetector(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color.fromARGB(100, 200, 200, 200)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              children: [
                                Container(
                                  child: customTextWidget("Sort By",
                                      fontWeight: FontWeight.bold),
                                  // color: Colors.yellow,
                                  padding: EdgeInsets.all(10),
                                ),
                                Image.asset(
                                  "assets/images/button_icons/downarrow.png",
                                  width: 15,
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(UtilFunctions.getReadableSortByValue_sortStyle()),
                      ],
                    ),
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 1), () {
                        showDialog(
                          context: context,
                          // builder: (BuildContext context) => BookingConfirmationDialog(),
                          builder: (BuildContext context) =>
                              ShowSortingDialog(interfaceType: "sortStyle", selectedCategory:""),
                        );
                      });

                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: FutureBuilder<List<TrendingStyles>>(
                  future: gblSortedData_sortStyle != null
                      ? gblSortedData_sortStyle
                      : getAllTrendingStyles(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TrendingStyles>> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data[index].image,
                                      fit: BoxFit.cover,
                                      height: width * 0.5,
                                      width: width,
                                    ),
                                  ),
                                  onTap: () {
                                    TrendingStyles ts =snapshot.data[index];
                                    // Goto Style screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StyleScreen(styleId: ts.sty_id, prevCtx: context),
                                      ),
                                    );

                                  },
                                ),
                                Center(
                                    child: customTextWidget(
                                        snapshot.data[index].name,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    customTextWidget(
                                      "\$" + snapshot.data[index].price,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    customTextWidget(
                                        PriceUtils.getFullPrice(
                                            snapshot.data[index].price),
                                        textColor: Colors.red,
                                        lineThrough: true)
                                  ],
                                )
                              ],
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
