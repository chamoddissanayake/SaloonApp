import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/models/ReviewCard.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/SimpleWidgets.dart';

class ReviewCardItem extends StatelessWidget {
  ReviewCard model;
  int pos;

  ReviewCardItem(ReviewCard model, int pos) {
    this.model = model;
    this.pos = pos;
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: boxDecoration(
            radius: 5,
            showShadow: true,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          child: new Icon(
                            Icons.person_rounded,
                            size: 60,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    customTextWidget(
                                        model.userFullName != null
                                            ? model.userFullName
                                            : "",
                                        textColor: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        maxLine: 2),
                                  ],
                                ),
                                Chip(
                                  backgroundColor: Colors.blue,
                                  label: customTextWidget(
                                    model.hairStyleName != null
                                        ? model.hairStyleName
                                        : "",
                                    fontSize: 12.0,
                                    textColor: Colors.white,
                                  ),
                                ),
                                customTextWidget(model.description,
                                    fontSize: 18.0, textColor: Colors.black),
                                RatingBar.builder(
                                  glow: true,
                                  ignoreGestures: true,
                                  itemCount:
                                      model.rating != null ? model.rating : 0,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
