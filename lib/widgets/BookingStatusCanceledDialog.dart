import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/models/Location.dart';
import 'package:saloon_app/service/LocationService.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';

class BookingStatusCanceledDialog extends StatefulWidget {

  final BookingStatusCardModel mBookingCanceled;

  BookingStatusCanceledDialog({Key key, this.mBookingCanceled}) : super(key: key);

  @override
  _BookingStatusCanceledDialogState createState() => _BookingStatusCanceledDialogState();
}

class _BookingStatusCanceledDialogState extends State<BookingStatusCanceledDialog> {

  BookingStatusCardModel mBookingCanceled;

  BookingStatusCardModel get c {
    return mBookingCanceled;
  }

  Location currentLoc;

  @override
  void initState() {
    super.initState();
    this.mBookingCanceled = widget.mBookingCanceled;
    // getLocationByIdFunc();
    // this.setState(() {
    // });
    // print(this.currentLoc);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: bookingStatusCanceledDialogContent(context, this.mBookingCanceled, this.currentLoc),
    );
  }

  // void getLocationByIdFunc() async{
  //   this.currentLoc =  await getLocationById(mBookingCanceled.location_id);
  //   this.setState(() { });
  //   print(this.currentLoc);
  // }
}

bookingStatusCanceledDialogContent(BuildContext context, BookingStatusCardModel mBookingCanceled, Location currentLocation) {
  return SingleChildScrollView(
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
            customTextWidget("Canceled Bookings",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
            SizedBox(height: 10),
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl:mBookingCanceled.tsObj.image,
                height: 120,
                width: 120,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(height: 24),
            Text(
              mBookingCanceled.tsObj.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(height: 10),
            Text("\$ "+mBookingCanceled.tsObj.price,
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
                          Text(UtilFunctions.splitDateAndTime(mBookingCanceled.date_time)[0], style: TextStyle(fontSize: 18))),
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
                          Text(UtilFunctions.splitDateAndTime(mBookingCanceled.date_time)[1], style: TextStyle(fontSize: 18))),
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
                      Text(mBookingCanceled.currentLoc.name , style: TextStyle(fontSize: 18)),
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
                    Navigator.pop(context);
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
                    child: customTextWidget("Close",
                        textColor: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        )),
  );
}