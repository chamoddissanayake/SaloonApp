import 'package:flutter/material.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/service/BookingService.dart';
import 'package:saloon_app/widgets/StatusCardItem.dart';

class BookingCanceledScreen extends StatefulWidget {
  @override
  _BookingCanceledScreenState createState() => _BookingCanceledScreenState();
}

class _BookingCanceledScreenState extends State<BookingCanceledScreen> {

  List<BookingStatusCardModel> mBookingCanceledList;
  int completeStatusIndex = 2;
  @override
  void initState() {
    super.initState();
    mBookingCanceledList = getCanceledBookings();
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
              itemCount: mBookingCanceledList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: StatusCardItem(mBookingCanceledList[index], index, completeStatusIndex),
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
