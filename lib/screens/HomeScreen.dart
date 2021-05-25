import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/screens/TrendingStylesScreen.dart';
import 'package:saloon_app/widgets/CustomTopBar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home screen Title'),
      // ),
      // appBar: setAppBar(),
      appBar: AppBar(
          //backgroundColor: Colors.blue,
          //automaticallyImplyLeading: true
          elevation: 0.0,
          // for elevation
          titleSpacing: 0.0,
          // if you want remove title spacing with back button
          title: Text('Saloon ABC'),
          // UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
          actions: <Widget>[
            // addAppBarActionWidgetProfile(icon, 30.0, 30.0, 15.0) // add your custom action widget
            // Icon(CupertinoIcons.bars)
            GestureDetector(
                onTap: () {
                  print("Search pressed");
                },
                child: Container(
                  child: Icon(CupertinoIcons.search),
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
                    print("bars pressed");
                  },
                  child: new Container(
                      // color: Colors.red,
                      padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                      // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
                      child: Icon(CupertinoIcons.bars)),
                ),
              ))),

      body: Center(
        child: ElevatedButton(
          child: Text('Test Button'),
          onPressed: () {
            print("Button pressed.");
            // Navigate to second route when tapped.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrendingStylesScreen()),
            );
          },
        ),
      ),
    );
  }

//
// Widget setAppBar() {
//   return new AppBar(
//     //backgroundColor: Colors.blue,
//     //automaticallyImplyLeading: true
//       elevation: 0.0, // for elevation
//       titleSpacing: 0.0, // if you want remove title spacing with back button
//       title: Text('Title'),// UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
//       actions: <Widget>[
//         // addAppBarActionWidgetProfile(icon, 30.0, 30.0, 15.0) // add your custom action widget
//         Icon(CupertinoIcons.add_circled_solid)
//       ],//Action icon search as search icon, notification icon
//       leading: new Material( //Custom leading icon, such as back icon or other icon
//         color: Colors.transparent,
//         child: new InkWell(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             splashColor: Colors.amber,
//             child: new Container(
//                 padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
//                 // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
//                 child:  Icon(CupertinoIcons.add_circled_solid),
//         ),
//       )
//   )
//   );

// }
}
