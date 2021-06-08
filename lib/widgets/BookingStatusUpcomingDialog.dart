import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/screens/BookingScreen.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/BookingStatusUpdateDialog.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';
import 'package:saloon_app/service/BookingService.dart';
import 'package:saloon_app/screens/BookingUpcomingScreen.dart';

class BookingStatusUpcomingDialog extends StatefulWidget {
  final BookingStatusCardModel mBookingUpcoming;
  final BuildContext upComingScreenContext;

  BookingStatusUpcomingDialog({Key key, this.mBookingUpcoming, this.upComingScreenContext}) : super(key: key);

  @override
  _BookingStatusUpcomingDialogState createState() => _BookingStatusUpcomingDialogState();
}

class _BookingStatusUpcomingDialogState extends State<BookingStatusUpcomingDialog> {


  BookingStatusCardModel mBookingUpcoming;
  BuildContext upComingScreenContext;
  BuildContext currentContext;

  BookingStatusCardModel get u {
    return mBookingUpcoming;
  }
  BuildContext get uc {
    return upComingScreenContext;
  }

  @override
  void initState() {
    super.initState();
    this.mBookingUpcoming = widget.mBookingUpcoming;
    this.upComingScreenContext = upComingScreenContext;
  }

  @override
  Widget build(BuildContext context) {
    this.currentContext = context;
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
                customTextWidget("Upcoming Bookings",
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
                SizedBox(height: 10),
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl:mBookingUpcoming.tsObj.image,
                    height: 120,
                    width: 120,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(height: 24),
                Text(
                  mBookingUpcoming.tsObj.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                SizedBox(height: 10),
                Text("\$ "+mBookingUpcoming.tsObj.price,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 80.0,
                              child: Text("Date",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18))),
                          SizedBox(
                              child:
                              Text(UtilFunctions.splitDateAndTime(mBookingUpcoming.date_time)[0], style: TextStyle(fontSize: 18))),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 80.0,
                            child: Text("Time",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          SizedBox(
                              child:
                              Text(UtilFunctions.splitDateAndTime(mBookingUpcoming.date_time)[1], style: TextStyle(fontSize: 18))),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 80.0,
                            child: Text("Branch",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          Text(mBookingUpcoming.currentLoc.name , style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        conformedCancelBookingTapped();
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: customTextWidget("Cancel Booking",
                            textColor: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 1), () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => BookingStatusUpdateDialog(mBookingUpcoming: mBookingUpcoming),
                          );
                        });

                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        decoration: new BoxDecoration(
                          color: Colors.orangeAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: customTextWidget("Update Booking",
                            textColor: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        conformedCompletedBookingTapped();
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 5, 16, 16),
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        decoration: new BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: customTextWidget("Mark as Done",
                            textColor: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  conformedCancelBookingTapped() async{
    bool  deleteStatus = await upcomingToCancelFunc(mBookingUpcoming);
    await CoolAlert.show(
      backgroundColor: Color(0xFFFFDEC1),
      context: context,
      type: CoolAlertType.success,
      text: "Your booking canceled successfully.",
    ).then((value) {
    });
    Navigator.pushNamed(context, '/booking').then((_) => setState(() {}));
    print("updated");

  }

  conformedCompletedBookingTapped()async{
    bool  doneStatus = await upcomingToCompletedFunc(mBookingUpcoming);
    await CoolAlert.show(
      backgroundColor: Color(0xFFFFDEC1),
      context: context,
      type: CoolAlertType.success,
      text: "Your booking was mark as done",
    ).then((value) {
    });
    // Navigator.pushNamed(context, '/booking').then((_) => setState(() {
    //   currentSelectedStatus = 1;
    // }));

    return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return BookingScreen(bookingTypeFromConstructor: 1);
    }));


    print("updated");
  }

}
