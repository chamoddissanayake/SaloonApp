import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/LocationsFloatingActionWidget.dart';
import 'package:saloon_app/widgets/BookingStatusButtonWidget.dart';
import 'package:saloon_app/models/StatusButton.dart';

import 'package:saloon_app/screens/BookingUpcomingScreen.dart';
import 'package:saloon_app/screens/BookingCompletedScreen.dart';
import 'package:saloon_app/screens/BookingCanceledScreen.dart';

class BookingScreen extends StatefulWidget {
  static const routeName = '/booking';

  final int bookingTypeFromConstructor;

  BookingScreen({Key key, this.bookingTypeFromConstructor}) : super(key: key);


  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  int bookingTypeFromConstructor=0;

  int get bt {
    return bookingTypeFromConstructor;
  }


  var statusBtnList =[];
  // var currentSelectedStatus = 0;

  @override
  void initState() {
    super.initState();
    addStatusButtonsToStatusBtnList();
    this.bookingTypeFromConstructor = widget.bookingTypeFromConstructor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(child: MainDrawer()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                  child: customTextWidget("My Bookings",
                      fontSize: 24.0, fontWeight: FontWeight.bold)),
            ),

            SizedBox(
              height: 40.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: statusBtnList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    print(statusBtnList[index]);
                    return GestureDetector(
                        onTap: (){
                          setState(() {
                            this.bookingTypeFromConstructor = index;
                          });
                        },
                        child: bookingStatusButtonWidget(statusBtnList[index].name, btnFontWeight: FontWeight.bold, btnColor:statusBtnList[index].color, currentSelectedStatus:bookingTypeFromConstructor, index:index));
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                if (bookingTypeFromConstructor == 0) BookingUpcomingScreen(),
                if (bookingTypeFromConstructor == 1) BookingCompletedScreen(),
                if (bookingTypeFromConstructor == 2) BookingCanceledScreen(),
              ],
            ),


          ],
        ),
      ),
      floatingActionButton: LocationsFloatingActionWidget(),
    );
  }

  void addStatusButtonsToStatusBtnList() {

    StatusButton tempStatusButtonUpcoming = new StatusButton();
    tempStatusButtonUpcoming.name = "Upcoming";
    tempStatusButtonUpcoming.color = Colors.green;

    StatusButton tempStatusButtonCompleted = new StatusButton();
    tempStatusButtonCompleted.name = "Completed";
    tempStatusButtonCompleted.color = Colors.blue;

    StatusButton tempStatusButtonCanceled = new StatusButton();
    tempStatusButtonCanceled.name = "Canceled";
    tempStatusButtonCanceled.color = Colors.red;


    statusBtnList.add(tempStatusButtonUpcoming);
    statusBtnList.add(tempStatusButtonCompleted);
    statusBtnList.add(tempStatusButtonCanceled);

  }
}
