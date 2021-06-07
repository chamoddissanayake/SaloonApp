// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:overlay_container/overlay_container.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/CustomBookButton.dart';
import 'package:saloon_app/widgets/CustomBackIcon.dart';
import 'package:saloon_app/commons/Locations.dart';
import 'package:saloon_app/models/Location.dart';
import 'package:saloon_app/models/Booking.dart';
import 'package:saloon_app/models/GoogleUser.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/service/LocationService.dart';
import 'package:saloon_app/widgets/BookingConfirmationDialog.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:saloon_app/utils/PriceUtils.dart';
import 'package:skeletor/skeletor.dart';

class StyleScreen extends StatefulWidget {
  static const routeName = '/style';

  final String styleId;
  final BuildContext prevCtx ;

  // In the constructor, require a Todo.
  StyleScreen({Key key, this.styleId, this.prevCtx}) : super(key: key);

  String get t {
    return styleId;
  }
  BuildContext get p {
    return prevCtx;
  }

  @override
  _StyleScreenState createState() => _StyleScreenState();
}

class _StyleScreenState extends State<StyleScreen> {
  String currentStyleId;

  List<Location> mLocationList;
  TrendingStyles currentStyleObj;
  BuildContext prevCtx;

  String selectedDate;
  String loc_id;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now().toString();

    getLocationsForFirstUser();


    currentStyleId = widget.styleId;
    prevCtx = widget.prevCtx;
    loadCurrentStyleData();
    print(currentStyleObj);
  }

  void getLocationsForFirstUser()async{
    this.mLocationList = await getAllLocations();
    this.loc_id = this.mLocationList[0].loc_id;
    this.setState(() { });
  }

  void loadCurrentStyleData() async {
    currentStyleObj = await getATrendingStyle(currentStyleId);
    this.setState(() {});
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
      body: Container(
        child: currentStyleObj != null
            ? Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width / 1,
                    child: CachedNetworkImage(
                      imageUrl:
                      currentStyleObj.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: <Widget>[

                      OverlayContainer(
                        materialColor: Colors.red,
                        show: true,
                        // Let's position this overlay to the right of the button.
                        position: OverlayContainerPosition(
                          // Left position.
                          20,
                          // Bottom position.
                          -30,
                        ),
                        // The content inside the overlay.
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.all(1),
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 3,
                                spreadRadius: 6,
                              )
                            ],
                          ),
                          child: customBackIcon(Colors.white,
                              Icons.keyboard_arrow_left, Colors.grey,  prevCtx),
                        )),


                      Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 35, left: 16),
                          child: Container(
                            width: 38,
                            height: 38,
                            child: Text(""),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                currentStyleObj.name,
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
                              Text(currentStyleObj.short_description,
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
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.2),
                    child: Container(
                      // color: Colors.red,
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
                                  currentStyleObj.description,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Price:  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text("\$ "+currentStyleObj.price,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 0),
                                        child: Text("\$ "+PriceUtils.getFullPrice(currentStyleObj.price),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.red,
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Time:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text(currentStyleObj.styling_time+ " mins",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    "Select Branch",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              FutureBuilder<List<Location>>(
                                  future: getAllLocations(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<Location>> snapshot) {
                                    List<Widget> children;
                                    if (snapshot.hasData) {
                                      children = <Widget>[
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.27,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: snapshot.data.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                    // color: Colors.yellow,
                                                    // height: 50,
                                                    child: GestureDetector(
                                                      onTap: (){
                                                            print(this.loc_id);
                                                            this.setState(() {
                                                              this.loc_id = snapshot.data[index].loc_id;
                                                            });
                                                            print(this.loc_id);
                                                      },
                                                      child: locations(
                                                          snapshot.data[index],
                                                          index, this.loc_id),
                                                    ));
                                              }),
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
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child:
                                              Text('Error: ${snapshot.error}'),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: children,
                                      ),
                                    );
                                  }),
                              Divider(),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    "Select Date and Time",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
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
                                    if (date.weekday == 6 ||
                                        date.weekday == 7) {
                                      return false;
                                    }

                                    return true;
                                  },
                                  onChanged: (val) {
                                    print(val);
                                    print("---");
                                    print(val);
                                    this.selectedDate = val;
                                  } ,
                                  validator: (val) {
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    "See Customer Photos and ratings",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                          icon: new Image.asset(
                                            "assets/images/item_view/camera.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          tooltip: 'View Customer Photo',
                                          onPressed: () {},
                                        ),
                                        Text('Customer Photos'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          icon: new Image.asset(
                                            "assets/images/item_view/rating.png",
                                            width: 50,
                                            height: 50,
                                          ),
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
                                  onPressed: () async{
                                    Booking newBooking = new Booking();
                                    newBooking.booking_id="";
                                    newBooking.date_time = this.selectedDate;
                                    newBooking.location = this.loc_id;
                                    newBooking.status = 0;
                                    newBooking.style_id = this.currentStyleId;

                                    Booking booking2 ;
                                    booking2 =  await this.getCurrentUser(newBooking);

                                    print(booking2);
                                    TrendingStyles ts1 = this.currentStyleObj;

                                    String branchName = "";
                                    for(var i = 0; i < mLocationList.length; i++){
                                      if(mLocationList[i].loc_id == booking2.location){
                                        branchName =  mLocationList[i].name;
                                      }
                                    }

                                    List<String> tempDT =[];
                                    tempDT = UtilFunctions.splitDateAndTime(booking2.date_time);

                                    print(tempDT);



                                    Future.delayed(
                                        const Duration(milliseconds: 1), () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            BookingConfirmationDialog(newBooking:booking2, currentStyleObject :ts1, tempDT:tempDT, branchName:branchName),
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
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text(""),
                    customTextWidget("Loading"),
                  ],
                ),
              ),
      ),
    );
  }

  Future<Booking> getCurrentUser(Booking newBooking) async{

    GoogleUser gu;
    CustomUser cu;

      if (await UtilFunctions.isCurrentUserGoogle() == true) {
        newBooking.user_type = 'G';
        gu = await UtilFunctions.getSharedStorageGoogleUser();
        newBooking.user_email = gu.email;
        this.setState(() {});

      } else if (await UtilFunctions.isCurrentUserGoogle() == false) {
        newBooking.user_type = 'C';
        cu = await UtilFunctions.getSharedStorageCustomUser();
        print(cu);
        newBooking.user_id = cu.objId;
        this.setState(() {});
      }
      return newBooking;
  }
}
