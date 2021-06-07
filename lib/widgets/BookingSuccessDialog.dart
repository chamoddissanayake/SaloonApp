import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/Booking.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/screens/MainScreen.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';

class BookingSuccessDialog extends StatefulWidget {
  final Booking newBooking;
  final TrendingStyles currentStyleObject;
  final List<String> tempDT;
  final String branchName;
  final String bookingId;

  BookingSuccessDialog({Key key, this.newBooking, this.currentStyleObject, this.tempDT, this.branchName, this.bookingId}) : super(key: key);



  @override
  _BookingSuccessDialogState createState() => _BookingSuccessDialogState();
}

class _BookingSuccessDialogState extends State<BookingSuccessDialog> {
  var isTickCompleting = true;


  Booking newBooking;
  TrendingStyles currentStyleObject;
  List<String> tempDT;
  String branchName;
  String bookingId;

  Booking get b {
    return newBooking;
  }

  TrendingStyles get cs {
    return currentStyleObject;
  }

  List<String> get dt {
    return tempDT;
  }

  String get bn {
    return branchName;
  }

  String get bi {
    return bookingId;
  }



  @override
  void initState() {
    super.initState();
    this.newBooking = widget.newBooking;
    this.currentStyleObject = widget.currentStyleObject;
    this.tempDT = widget.tempDT;
    this.branchName = widget.branchName;
    this.bookingId = widget.bookingId;


    print(this.newBooking);
    print(this.currentStyleObject);
    print(this.tempDT);
    print(this.branchName);

    Future.delayed(const Duration(milliseconds: 1000), () {
      isTickCompleting= false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
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
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.close, color: Colors.black)),
              ),
              customTextWidget("Booking Success",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
              SizedBox(height: 24),

              Container(
                child: isTickCompleting ? Image.asset(
                  "assets/images/booking_done/tick.gif",
                  height: 120.0,
                  width: 120.0,
                ) : Image.asset(
                  "assets/images/booking_done/tickStable.png",
                  height: 120.0,
                  width: 120.0,
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Booking ID:  ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "#"+bookingId,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // Divider(),
              // Text(
              //   "Confirmation mail sent to:",
              //   style: TextStyle(fontSize: 18),
              // ),
              // Text(
              //   "aaabbb@gmail.com",
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              Divider(),
              SizedBox(height: 10),
              Text(
                currentStyleObject.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              SizedBox(height: 10),
              Text("\$ "+currentStyleObject.price,
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
                            Text(tempDT[0], style: TextStyle(fontSize: 18))),
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
                            Text(tempDT[1], style: TextStyle(fontSize: 18))),
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
                        Text(branchName, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
                },
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  decoration: new BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: customTextWidget("Done",
                      textColor: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          )),
    );
  }
}

