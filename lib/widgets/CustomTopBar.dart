import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTopBar extends StatefulWidget {
  @override
  _CustomTopBarState createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      //backgroundColor: Colors.blue,
      //automaticallyImplyLeading: true
        elevation: 0.0, // for elevation
        titleSpacing: 0.0, // if you want remove title spacing with back button
        title: Text('Title'),// UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
        actions: <Widget>[
          // addAppBarActionWidgetProfile(icon, 30.0, 30.0, 15.0) // add your custom action widget
          Icon(CupertinoIcons.ant_fill)
        ],//Action icon search as search icon, notification icon
        leading: new Material( //Custom leading icon, such as back icon or other icon
            color: Colors.transparent,
            child: new InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              splashColor: Colors.amber,
              child: new Container(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
                child:  Icon(CupertinoIcons.airplane),
              ),
            )
        )
    );
  }
}
