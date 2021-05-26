import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/CustomBookButton.dart';
import 'package:saloon_app/widgets/CustomBackIcon.dart';

class StyleScreen extends StatefulWidget {
  static const routeName = '/style';
  @override
  _StyleScreenState createState() => _StyleScreenState();
}

class _StyleScreenState extends State<StyleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50.0),
      //   child:AppBarWidget() ,
      // ),
      drawer: Drawer(
        child: SingleChildScrollView(child: MainDrawer()),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width / 1,
            child: CachedNetworkImage(
              imageUrl: "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2Fec909c634ee207713925dc785fe3e86a.jpg?alt=media&token=c2631b0c-f650-42ef-8ab7-22e88a242d54",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 35, left: 16),
                  child: customBackIcon(Colors.white, Icons.keyboard_arrow_left, Colors.grey)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  // child: Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     // starText("4", t7white),
                  //     // starText("24+", t7white),
                  //     Text("1111"),
                  //     Text("111"),
                  //   ],
                  // ),
                  child: Column(
                    children: [
                      Text("Abc Style", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,  shadows: [
                        Shadow( // bottomLeft
                            offset: Offset(-0.2, -0.2),
                            color: Colors.white
                        ),
                        Shadow( // bottomRight
                            offset: Offset(0.2, -0.2),
                            color: Colors.white
                        ),
                        Shadow( // topRight
                            offset: Offset(0.2, 0.2),
                            color: Colors.white
                        ),
                        Shadow( // topLeft
                            offset: Offset(-0.2, 0.2),
                            color: Colors.black
                        ),
                      ]),),
                      Text("lorem ipsum is a dummy text",style: TextStyle(color: Colors.white, fontSize: 20,  shadows: [
                        Shadow( // bottomLeft
                            offset: Offset(-0.2, -0.2),
                            color: Colors.white
                        ),
                        Shadow( // bottomRight
                            offset: Offset(0.2, -0.2),
                            color: Colors.white
                        ),
                        Shadow( // topRight
                            offset: Offset(0.2, 0.2),
                            color: Colors.white
                        ),
                        Shadow( // topLeft
                            offset: Offset(-0.2, 0.2),
                            color: Colors.black
                        ),
                      ])),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.2),
            child: Container(
              height: MediaQuery.of(context).size.height - 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.width / 1.35),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Divider(),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: CustomBookButton(
                        bgColor: Colors.green,
                        textContent: "Book Now",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    SizedBox(
                      height: 200,
                    ),
                    Divider(),
                    Divider(),
                    SizedBox(
                      height: 200,
                    ),
                    Divider(),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
