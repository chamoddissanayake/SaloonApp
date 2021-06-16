import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:saloon_app/models/ReviewCard.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/service/ReviewService.dart';
import 'package:saloon_app/service/SearchService.dart';
import 'package:saloon_app/screens/StyleScreen.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';
import 'package:saloon_app/widgets/ReviewCardtem.dart';
import 'package:saloon_app/widgets/ReviewsFloatingActionWidget.dart';
import 'package:saloon_app/widgets/SearchResultCard.dart';

class ReviewsScreen extends StatefulWidget {
  static const routeName = '/reviews';

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  String inputText = "";
  List<ReviewCard> mAllReviewsList;

  @override
  void initState() {
    super.initState();
    loadAllReviews();
  }

  void loadAllReviews() async {
    this.mAllReviewsList = await getAllReviews();
    this.setState(() {});
    print(this.mAllReviewsList);
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
                  child: customTextWidget("Shop reviews",
                      fontSize: 24.0, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                mAllReviewsList != null
                    ? Expanded(
                        child: mAllReviewsList.length > 0
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: new ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: mAllReviewsList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: GestureDetector(
                                          // onTap: () {
                                          // Future.delayed(
                                          //     const Duration(milliseconds: 1), () {
                                          //   showDialog(
                                          //     context: context,
                                          //     builder: (BuildContext context) =>
                                          //         BookingStatusCompletedDialog(
                                          //             mBookingCompleted:
                                          //                 mBookingCompletedList[
                                          //                     index]),
                                          //   );
                                          // });
                                          // },
                                          child: ReviewCardItem(
                                              mAllReviewsList[index], index)),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    customTextWidget("No Reviews available."),
                                  ],
                                ),
                              ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
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
            ),
          ],
        ),
      ),
      floatingActionButton: ReviewsFloatingActionWidget(),
    );
  }
}

// https://pub.dev/packages/material_floating_search_bar
