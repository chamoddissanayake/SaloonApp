import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloon_app/commons/Locations.dart';
import 'package:saloon_app/models/Booking.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/service/BookingService.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/commons/Locations.dart';
import 'package:saloon_app/models/Location.dart';
import 'package:saloon_app/service/LocationService.dart';

class BookingStatusUpdateDialog extends StatefulWidget {

  final BookingStatusCardModel mBookingUpcoming;

  BookingStatusUpdateDialog({Key key, this.mBookingUpcoming}) : super(key: key);


  @override
  _BookingStatusUpdateDialogState createState() => _BookingStatusUpdateDialogState();
}

class _BookingStatusUpdateDialogState extends State<BookingStatusUpdateDialog> {

  List<Location> mLocationList = [];
  BookingStatusCardModel mBookingUpcoming;
  String selectedLoc = "";
  String newDateTime= "";

  BookingStatusCardModel get bu {
    return mBookingUpcoming;
  }

  @override
  void initState() {
    super.initState();
    // mLocationList = getAllLocations();
    this.mBookingUpcoming = widget.mBookingUpcoming;
    print(this.mBookingUpcoming);
    getLocationsFunc();
    print(this.mLocationList );
  }

  void getLocationsFunc()async{
    this.mLocationList = await getAllLocations();
    // this.loc_id = this.mLocationList[0].loc_id;
    this.setState(() { });
  }


  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.close, color: Colors.black)),
                ),
                customTextWidget("Booking Update",
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
                SizedBox(height: 10),
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl:
                    this.mBookingUpcoming.tsObj.image,
                    height: 120,
                    width: 120,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(height: 24),
                Text(
                  this.mBookingUpcoming.tsObj.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                SizedBox(height: 10),
                Text("\$ "+this.mBookingUpcoming.tsObj.price,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 150.0,
                              child: Text("Selected Date",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18))),
                          SizedBox(
                              child:
                              Text(UtilFunctions.splitDateAndTime(this.mBookingUpcoming.date_time)[0], style: TextStyle(fontSize: 18))),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 150.0,
                            child: Text("Selected Time",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          SizedBox(
                              child:
                              Text(UtilFunctions.splitDateAndTime(this.mBookingUpcoming.date_time)[1], style: TextStyle(fontSize: 18))),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 150.0,
                            child: Text("Selected Branch",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          Text(this.mBookingUpcoming.currentLoc.name, style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  FutureBuilder<List<Location>>(
                      future: getAllLocations(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Location>> snapshot) {
                        List<Widget> children;
                        if (snapshot.hasData) {
                          children = <Widget>[
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.width * 0.27,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {

                                    // if(mBookingUpcoming.currentLoc.loc_id ==  snapshot.data[index].loc_id){
                                    //   selectedLoc = mBookingUpcoming.currentLoc.loc_id;
                                    // }

                                    return Container(
                                      // color: Colors.yellow,
                                      // height: 50,
                                        child: GestureDetector(
                                          onTap: (){
                                            print(this.selectedLoc);
                                            this.setState(() {
                                              this.selectedLoc = snapshot.data[index].loc_id;
                                            });
                                            print(this.selectedLoc);
                                          },
                                          child: locations(
                                              snapshot.data[index], index,selectedLoc),
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  child: Container(
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
                      onChanged: (val) {
                        this.newDateTime = val.toString();
                      } ,
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) => print(val),
                    ),
                  ),
                ),

                Column(
                  children: [

                    GestureDetector(
                      onTap: () {
                        // print(this.newDateTime);
                        // print(this.selectedLoc);
                        // print(this.mBookingUpcoming);

                        this.mBookingUpcoming.location_id  = this.selectedLoc;
                        this.mBookingUpcoming.date_time = this.newDateTime;

                        updateBookingFunc(this.mBookingUpcoming);

                        // Navigator.pop(context);
                        CoolAlert.show(
                          backgroundColor: Color(0xFFFFDEC1),
                          context: context,
                          type: CoolAlertType.success,
                          text: "Your Booking updated successfully",
                        );

                      },
                      child: Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        decoration: new BoxDecoration(
                          color: Colors.orangeAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: customTextWidget("Update",
                            textColor: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  void updateBookingFunc(BookingStatusCardModel mBookingUpcoming)async {
    bool updateStatus = await updateBooking(mBookingUpcoming);
    await CoolAlert.show(
      backgroundColor: Color(0xFFFFDEC1),
      context: context,
      type: CoolAlertType.success,
      text: "Your booking updated successfully.",
    ).then((value) {
    });
    Navigator.pushNamed(context, '/booking').then((_) => setState(() {}));
    print("updated");




  }
}




