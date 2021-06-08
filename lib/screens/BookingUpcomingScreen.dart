import 'package:flutter/material.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/service/BookingService.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/StatusCardItem.dart';
import 'package:saloon_app/widgets/BookingStatusUpcomingDialog.dart';

class BookingUpcomingScreen extends StatefulWidget {
  @override
  _BookingUpcomingScreenState createState() => _BookingUpcomingScreenState();
}

class _BookingUpcomingScreenState extends State<BookingUpcomingScreen> {

  List<BookingStatusCardModel> mBookingUpcomingList;
  int completeStatusIndex = 0;
  @override
  void initState() {
    super.initState();
    // mBookingUpcomingList = getUpcomingBookings();
    loadUpcomingBookings();
  }

  void loadUpcomingBookings() async{
    this.mBookingUpcomingList = await getUpcomingBookings();
    this.setState(() { });
    print(this.mBookingUpcomingList);
  }


  @override
  Widget build(BuildContext context) {
    return  new Row(
      children: <Widget>[
        mBookingUpcomingList != null  ?Expanded(
          child: mBookingUpcomingList.length >0? SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mBookingUpcomingList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GestureDetector(onTap: (){
                    // Future.delayed(const Duration(milliseconds: 1), () {
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) => BookingStatusCanceledDialog(mBookingCanceled: mBookingCanceledList[index]),
                    //   );
                    // });

                  }, child: StatusCardItem(mBookingUpcomingList[index], index, completeStatusIndex)),
                );
              },
            ),
          ): SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customTextWidget("No Upcoming bookings."),
              ],
            ),
          ),
        ):Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.7,
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
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
