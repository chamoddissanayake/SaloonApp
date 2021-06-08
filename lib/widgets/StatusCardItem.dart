import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/SimpleWidgets.dart';

class StatusCardItem extends StatelessWidget {
  BookingStatusCardModel model;
  int pos;
  int completeStatusIndex;

  StatusCardItem(BookingStatusCardModel model, int pos, int completeStatusIndex) {
    this.model = model;
    this.pos = pos;
    this.completeStatusIndex = completeStatusIndex;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: boxDecoration(radius: 10, showShadow: true, completeStatusIndex: completeStatusIndex),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: model.tsObj.image,
                            width: 120,
                            height: 120,
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
                                    customTextWidget(model.tsObj.name,
                                        textColor: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        maxLine: 2),
                                  ],
                                ),
                                customTextWidget(UtilFunctions.splitDateAndTime(model.date_time)[0] ,
                                    fontSize: 18.0,
                                    textColor: Colors.black ),
                                customTextWidget(UtilFunctions.splitDateAndTime(model.date_time)[1],
                                    fontSize: 18.0,
                                    textColor: Colors.black ),
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
