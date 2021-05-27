import 'package:flutter/material.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/service/BookingService.dart';
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
    mBookingUpcomingList = getUpcomingBookings();
  }

  @override
  Widget build(BuildContext context) {
    return  new Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mBookingUpcomingList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GestureDetector(onTap: (){
                    Future.delayed(const Duration(milliseconds: 1), () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => BookingStatusUpcomingDialog(),
                      );
                    });
                  }, child: StatusCardItem(mBookingUpcomingList[index], index, completeStatusIndex)),
                );
              },
            ),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
