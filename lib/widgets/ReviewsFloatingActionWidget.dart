import 'package:flutter/material.dart';
import 'package:saloon_app/screens/AddReviewScreen.dart';
import 'package:saloon_app/screens/MapScreen.dart';

class ReviewsFloatingActionWidget extends StatefulWidget {
  @override
  _ReviewsFloatingActionWidgetState createState() =>
      _ReviewsFloatingActionWidgetState();
}

class _ReviewsFloatingActionWidgetState
    extends State<ReviewsFloatingActionWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: new Icon(
        Icons.star,
        color: Colors.lightBlue,
        size: 30,
      ),
      tooltip: "Add a review",
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed(MapScreen.routeName);
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new AddReviewScreen()));
      },
    );
  }
}
