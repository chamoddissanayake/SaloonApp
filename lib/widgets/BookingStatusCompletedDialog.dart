import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/PaymentDialog.dart';

class BookingStatusCompletedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: bookingStatusCompletedDialogContent(context),
    );
  }
}

bookingStatusCompletedDialogContent(BuildContext context) {
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
            customTextWidget("Booking Done",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
            SizedBox(height: 10),
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2Fec909c634ee207713925dc785fe3e86a.jpg?alt=media&token=c2631b0c-f650-42ef-8ab7-22e88a242d54",
                height: 120,
                width: 120,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(height: 24),
            Text(
              "Style Abc",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(height: 10),
            Text("\$5.34",
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
                              Text("02/20/2020", style: TextStyle(fontSize: 18))),
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
                              Text("10:00 AM", style: TextStyle(fontSize: 18))),
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
                      Text("Gampaha", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Write your review here'),
              ),
            ),
            SizedBox(height: 24),
            Container(

            ),

            SizedBox(height: 24),
            RatingBar.builder(
                initialRating: 3,
                itemCount: 5,
                // ignore: missing_return
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                      );
                    case 4:
                      return Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                  }
                },
                onRatingUpdate: (rating) {
                  print(rating);
                },
            ),

            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              decoration: new BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customTextWidget("Upload My Photo",
                      textColor: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                  new Image.asset(
                    "assets/images/button_icons/selfie.png",
                    width: 35,
                    height: 35,
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: customTextWidget("Cancel",
                        textColor: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {

                    Navigator.pop(context);
                    CoolAlert.show(
                      backgroundColor: Color(0xFFD7FFD4),
                      context: context,
                      type: CoolAlertType.success,
                      text: "Your Reviews added successfully",
                    );

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
                    child: customTextWidget("Submit",
                        textColor: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        )),
  );
}



void myInitCallback(context){
  CoolAlert.show(
    backgroundColor: Colors.greenAccent.shade50,
    context: context,
    type: CoolAlertType.success,
    text: "Your transaction was successful!",
  );
}