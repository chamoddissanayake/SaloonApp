import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/Categories.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';

class AllCategories extends StatefulWidget {
  static const routeName = '/all_categories';
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width - 50;
    final Size cardSize = Size(width, width / 1.8);


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
                  customTextWidget("All Categories", fontSize:  20.0, fontWeight: FontWeight.bold),
                  // Text("Sort By"),
                ],
              ),
            ),


            SizedBox(
              height: 24.0,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0),
              // child: GridView.builder(
              //   scrollDirection: Axis.vertical,
              //   itemCount: mCategoriesList.length,
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     return Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         ClipRRect(
              //           borderRadius: BorderRadius.all(
              //               Radius.circular(10.0)),
              //           child: CachedNetworkImage(
              //             imageUrl: mCategoriesList[index].image,
              //             fit: BoxFit.cover,
              //             height: width * 0.5,
              //             width: width,
              //           ),
              //         ),
              //         Center(child: customTextWidget(mCategoriesList[index].name, fontSize: 18.0, fontWeight: FontWeight.bold)),
              //       ],
              //     );
              //   },
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //     childAspectRatio: 0.7,
              //   ),
              //  ),
              child: FutureBuilder<List<Categories>>(
                  future: getAllCategories(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Categories>> snapshot) {
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
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data[index].image,
                                fit: BoxFit.cover,
                                height: width * 0.5,
                                width: width,
                              ),
                            ),
                            Center(child: customTextWidget(snapshot.data[index].name, fontSize: 18.0, fontWeight: FontWeight.bold)),
                          ],
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      )
                    )

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
