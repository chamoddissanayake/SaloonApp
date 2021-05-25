import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/screens/SearchScreen.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return AppBar(
      //backgroundColor: Colors.blue,
      //automaticallyImplyLeading: true
        elevation: 0.0,
        // for elevation
        titleSpacing: 0.0,
        // if you want remove title spacing with back button
        title: Text('Saloon ABCD'),
        // UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
        actions: <Widget>[
          // addAppBarActionWidgetProfile(icon, 30.0, 30.0, 15.0) // add your custom action widget
          // Icon(CupertinoIcons.bars)
          GestureDetector(
              onTap: () {
                print("Search pressed");
                // Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new SearchScreen())
                );
              },
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 15.0),
                child: new Image.asset("assets/images/top_bar/search.png", width: 30, height: 30,),
                // color: Colors.yellow,
              ))
        ],
        //Action icon search as search icon, notification icon
        leading: new Material(
          //Custom leading icon, such as back icon or other icon
            color: Colors.transparent,
            child: new InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              // splashColor: Colors.amber,
              child: GestureDetector(
                onTap: (){
                  print("pressed");
                  // Scaffold.of(context).openDrawer();
                },
                child: new Container(
                  // color: Colors.red,
                    padding:
                    const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                    // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
                    child: Icon(CupertinoIcons.bars)),
              ),
            )
        )
    );


  }
}
