import 'package:flutter/material.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/service/BookingService.dart';
import 'package:saloon_app/widgets/StatusCardItem.dart';
import 'package:saloon_app/widgets/BookingStatusCompletedDialog.dart';

class BookingCompletedScreen extends StatefulWidget {
  @override
  _BookingCompletedScreenState createState() => _BookingCompletedScreenState();
}

class _BookingCompletedScreenState extends State<BookingCompletedScreen> {

  List<BookingStatusCardModel> mBookingCompletedList;
  int completeStatusIndex = 1;
  @override
  void initState() {
    super.initState();
    mBookingCompletedList = getCompletedBookings();
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
              itemCount: mBookingCompletedList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GestureDetector(
                    onTap: (){
                      Future.delayed(const Duration(milliseconds: 1), () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => BookingStatusCompletedDialog(),
                        );
                      });
                    },
                      child: StatusCardItem(mBookingCompletedList[index], index, completeStatusIndex)),
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
