import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/CustomBookButton.dart';
import 'package:saloon_app/widgets/CustomBackIcon.dart';
import 'package:saloon_app/commons/Locations.dart';
import 'package:saloon_app/models/Location.dart';
import 'package:saloon_app/service/LocationService.dart';
import 'package:saloon_app/widgets/BookingConfirmationDialog.dart';
import 'package:date_time_picker/date_time_picker.dart';

class StyleScreen extends StatefulWidget {
  static const routeName = '/style';

  final String styleId;

  // In the constructor, require a Todo.
  StyleScreen({Key key,  this.styleId}) : super(key: key);

  String get t {
    return styleId;
  }

  @override
  _StyleScreenState createState() => _StyleScreenState();
}

class _StyleScreenState extends State<StyleScreen> {
  String currentStyleId ;
  List<Location> mLocationList;


  @override
  void initState() {
    super.initState();
    mLocationList = getAllLocations();
    currentStyleId = widget.styleId;


  }

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
              imageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2Fec909c634ee207713925dc785fe3e86a.jpg?alt=media&token=c2631b0c-f650-42ef-8ab7-22e88a242d54",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 35, left: 16),
                  child: customBackIcon(
                      Colors.white, Icons.keyboard_arrow_left, Colors.grey)),
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
                      Text(
                        "Abc Style",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-0.2, -0.2),
                                  color: Colors.white),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(0.2, -0.2),
                                  color: Colors.white),
                              Shadow(
                                  // topRight
                                  offset: Offset(0.2, 0.2),
                                  color: Colors.white),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-0.2, 0.2),
                                  color: Colors.black),
                            ]),
                      ),
                      Text("lorem ipsum is a dummy text",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-0.2, -0.2),
                                    color: Colors.white),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(0.2, -0.2),
                                    color: Colors.white),
                                Shadow(
                                    // topRight
                                    offset: Offset(0.2, 0.2),
                                    color: Colors.white),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-0.2, 0.2),
                                    color: Colors.black),
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
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width / 1.35),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          child: new Image.asset(
                            "assets/images/bottom_bar/favourites.png",
                            width: 45,
                            height: 45,
                          ),
                          onTap: () {
                            print('Heart pressed');
                          },
                        ),
                      ),
                      Divider(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Price:  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text('\$10.00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text('\$10.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Time:  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20)),
                              Text('20 mins.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20)),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "Select Branch",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.27,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mLocationList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                // color: Colors.yellow,
                                // height: 50,
                                  child: locations(mLocationList[index], index));
                            }),
                      ),
                      Divider(),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "Select Date and Time",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),


                      Container(
                        child: DateTimePicker(
                          type: DateTimePickerType.dateTimeSeparate,
                          dateMask: 'd MMM, yyyy',
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",
                          selectableDayPredicate: (date) {
                            // Disable weekend days to select from the calendar
                            if (date.weekday == 6 || date.weekday == 7) {
                              return false;
                            }

                            return true;
                          },
                          onChanged: (val) => print(val),
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        ),
                      ),
                      Divider(),

                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "See Customer Photos and ratings",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  icon:new Image.asset("assets/images/item_view/camera.png", width: 50, height: 50,),
                                  tooltip: 'View Customer Photo',
                                  onPressed: () {},
                                ),
                                Text('Customer Photos'),
                              ],
                            ),

                            Column(
                              children: [
                                IconButton(
                                  icon: new Image.asset("assets/images/item_view/rating.png",width: 50, height: 50,),
                                  tooltip: 'View Ratings',
                                  onPressed: () {},
                                ),
                                Text('Ratings'),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: CustomBookButton(
                          bgColor: Colors.blue,
                          textContent: "Book Now",
                          onPressed: () {
                            Future.delayed(const Duration(milliseconds: 1), () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => BookingConfirmationDialog(),
                              );
                            });

                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(),







                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
