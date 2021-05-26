import 'package:flutter/material.dart';
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
                  customTextWidget("All Categories", fontSize:  20.0, fontWeight: FontWeight.bold),
                  // Text("Sort By"),
                ],
              ),
            ),

            Text("All Categories"),
            Text("All Categories"),
            Text("All Categories"),
            Text("All Categories"),
            Text("All Categories"),
            Text("All Categories"),
          ],
        ),
      ),
    );
  }
}
