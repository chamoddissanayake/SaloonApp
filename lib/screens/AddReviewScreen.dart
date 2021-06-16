import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/models/GoogleUser.dart';
import 'package:saloon_app/models/Review.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/screens/ReviewsScreen.dart';
import 'package:saloon_app/service/ReviewService.dart';
import 'package:saloon_app/service/StylesCategoriesService.dart';
import 'package:saloon_app/service/UserService.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';
import 'package:saloon_app/utils/google_sign_in.dart';
import 'package:provider/provider.dart';

class AddReviewScreen extends StatefulWidget {
  static const routeName = '/add_review';
  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  List<TrendingStyles> trendingStyles;

  String hairStyleId;
  String description;
  int rating;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadTrendingStyles();
  }

  void loadTrendingStyles() async {
    this.trendingStyles = await getTrendingStyles();
    this.setState(() {});
    print(this.trendingStyles);
  }

  Future<String> _submitReview(BuildContext context) async {
    CustomUser currentUser = await getcurrentUserData();
    Review inputUserObj = new Review();
    inputUserObj.userId = currentUser.objId;
    inputUserObj.description = this.description;
    inputUserObj.rating = this.rating;
    inputUserObj.hairStyleId = this.hairStyleId;

    String returnedReview = await addNewReview(inputUserObj);

    if (returnedReview != "") {
      showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
                title: Text('Review submitted !'),
                content: Icon(
                  Icons.check,
                  size: 50,
                ),
              ));
      sleep(new Duration(seconds: 1));
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new ReviewsScreen()));
    } else {
      return 'Failed to submit the review';
    }
  }

  Future<CustomUser> getcurrentUserData() async {
    if (await UtilFunctions.isCurrentUserGoogle() == true) {
      GoogleUser googleUser;
      googleUser = await UtilFunctions.getSharedStorageGoogleUser();
      return await getCurrentUser(googleUser.email);
    } else if (await UtilFunctions.isCurrentUserGoogle() == false) {
      CustomUser currentUser;
      currentUser = await UtilFunctions.getSharedStorageCustomUser();
      return await getCurrentUser(currentUser.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DropdownButton<TrendingStyles>(
                    hint: Text("Select hair style"),
                    value: trendingStyles[0],
                    onChanged: (TrendingStyles style) {
                      setState(() {
                        this.hairStyleId = style.sty_id;
                      });
                    },
                    items: trendingStyles.map((TrendingStyles style) {
                      return DropdownMenuItem<TrendingStyles>(
                        value: style,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              style.name,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Add your review here',
                      labelText: 'Review',
                    ),
                    onChanged: (String description) {
                      setState(() {
                        this.description = description;
                      });
                    },
                  ),
                  RatingBar.builder(
                    glow: true,
                    itemCount: 0,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    onRatingUpdate: (rating) {
                      var newRating = rating;
                      setState(() {
                        this.rating = newRating.toInt();
                      });
                    },
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                      child: new ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: () => _submitReview(context),
                      )),
                ],
              ),
            )));
  }

  void googleLoginPressed() {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.login();
  }
}
