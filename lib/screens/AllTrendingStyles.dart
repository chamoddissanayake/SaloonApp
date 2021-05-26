import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/utils/PriceUtils.dart';
import 'package:saloon_app/widgets/ShowSortBy.dart';
import 'package:saloon_app/screens/StyleScreen.dart';

class AllTrendingStyles extends StatefulWidget {
  static const routeName = '/all_trending_styles';

  @override
  _AllTrendingStylesState createState() => _AllTrendingStylesState();
}

class _AllTrendingStylesState extends State<AllTrendingStyles> {
  List<TrendingStyles> mTrendingStylesList;

  @override
  void initState() {
    super.initState();
    mTrendingStylesList = getAllTrendingStyles();
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
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color.fromARGB(100, 200, 200, 200)
                      ),

                      child: customTextWidget("Sort By", fontWeight: FontWeight.bold),
                      // color: Colors.yellow,
                      padding: EdgeInsets.all(10),

                    ),
                    onTap: () {
                      print("aaa");
                      sortPopupPressed(context);
                      // showSortByDialog(context);
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
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mTrendingStylesList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: CachedNetworkImage(
                            imageUrl: mTrendingStylesList[index].image,
                            fit: BoxFit.cover,
                            height: width * 0.5,
                            width: width,
                          ),
                        ),
                        onTap: (){
                          //Goto Style screen
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new StyleScreen())
                          );
                        },
                      ),
                      Center(
                          child: customTextWidget(
                              mTrendingStylesList[index].name,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          customTextWidget(
                            "\$" + mTrendingStylesList[index].price,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          customTextWidget(
                              PriceUtils.getFullPrice(
                                  mTrendingStylesList[index].price),
                              textColor: Colors.red,
                              lineThrough: true)
                        ],
                      )
                    ],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
