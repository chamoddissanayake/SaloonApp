import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:saloon_app/models/Booking.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/models/GoogleUser.dart';
import 'package:saloon_app/models/Location.dart';
import 'package:saloon_app/models/Review.dart';
import 'package:saloon_app/models/ReviewCard.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/screens/MapScreen.dart';
import 'package:saloon_app/service/UserService.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';

import 'LocationService.dart';
import 'StylesCategoriesService.dart';

Future<List<ReviewCard>> getAllReviews() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _reviewsCollection =
      _firestore.collection('reviews');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _reviewsCollection.get();

  List<Review> allData;

  allData = querySnapshot.docs.map((doc) {
    // loc.loc_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;

    Review reviewObj = Review();
    reviewObj.reviewId = doc.id;
    reviewObj.userId = tmp.remove("userId");
    reviewObj.description = tmp.remove("description");
    reviewObj.hairStyleId = tmp.remove("hairStyleId");
    reviewObj.rating = tmp.remove("rating");

    return reviewObj;
  }).toList();

  print(allData);

  allData.removeWhere((value) => value == null);
  print(allData);

  List<ReviewCard> allReviews = [];

  for (var i = 0; i < allData.length; i++) {
    Review currentItem = allData[i];

    TrendingStyles ts = await getATrendingStyle(currentItem.hairStyleId);
    print(ts);

    CustomUser customUser = await getUserById(currentItem.userId);

    ReviewCard reviewCard = ReviewCard(
      currentItem.reviewId,
      currentItem.userId,
      customUser.first_name + " " + customUser.last_name,
      currentItem.hairStyleId,
      ts.name,
      currentItem.description,
      currentItem.rating,
    );

    allReviews.add(reviewCard);
  }

  print("***************");
  print(allReviews);
  print("***************");

  return allReviews;
}

Future<TrendingStyles> getTrendingStylesById(String style_id) async {
  TrendingStyles ts = await getTrendingStyleById(style_id);
  return ts;
}

Future<String> addNewReview(Review review) async {
  CollectionReference nb = FirebaseFirestore.instance.collection('reviews');
  return nb.add({
    "userId": review.userId,
    "hairStyleId": review.hairStyleId,
    "description": review.description,
    "rating": review.rating,
  }).then((value) {
    print("Review added");
    return value.id;
  }).catchError((error) {
    print("Failed to add the review: $error");
    return "";
  });
}

Future<bool> upcomingToCancelFunc(BookingStatusCardModel obj) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _bookingCollection =
      _firestore.collection('bookings');

  _bookingCollection.doc(obj.booking_id).update({
    "booking_status": "2",
    "date_time": obj.date_time,
    "location_id": obj.location_id,
    "style_id": obj.style_id,
    "user_email": obj.user_email,
    "user_id": obj.user_id,
    "user_type": obj.user_type
  }).then((_) {
    print("update for booking cancel success!");
    return true;
  });
}

Future<bool> updateBooking(BookingStatusCardModel mBookingUpcoming) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _bookingCollection =
      _firestore.collection('bookings');

  _bookingCollection.doc(mBookingUpcoming.booking_id).update({
    "booking_status": "0",
    "date_time": mBookingUpcoming.date_time,
    "location_id": mBookingUpcoming.location_id,
    "style_id": mBookingUpcoming.style_id,
    "user_email": mBookingUpcoming.user_email,
    "user_id": mBookingUpcoming.user_id,
    "user_type": mBookingUpcoming.user_type
  }).then((_) {
    print("Booking update success!");
    return true;
  });
}
