import 'package:flutter/material.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/service/BookingService.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/StatusCardItem.dart';
import 'package:saloon_app/widgets/BookingStatusCanceledDialog.dart';

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

    loadCanceledBookings();
  }

  void loadCanceledBookings() async{
    this.mBookingCanceledList = await getCanceledBookings();
    this.setState(() { });
    print(this.mBookingCanceledList);
  }
  @override
  Widget build(BuildContext context) {
    return  new Row(
      children: <Widget>[
        mBookingCanceledList != null  ?Expanded(
          child: mBookingCanceledList.length >0? SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mBookingCanceledList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GestureDetector(onTap: (){
                    Future.delayed(const Duration(milliseconds: 1), () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => BookingStatusCanceledDialog(mBookingCanceled: mBookingCanceledList[index]),
                      );
                    });

                  }, child: StatusCardItem(mBookingCanceledList[index], index, completeStatusIndex)),
                );
              },
            ),
          ): SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customTextWidget("No Canceled bookings."),
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
