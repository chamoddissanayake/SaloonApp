import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';
import 'package:saloon_app/models/Location.dart';


class locations extends StatelessWidget {
  Location model;

  locations(Location mLocations, int index){
    this.model = mLocations;
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          // color: Colors.red,
          margin: EdgeInsets.only(left: 10),
          width: width * 0.2,
          height: width*0.26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: model.image,
                  height: width * 0.2,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              //text(model.name),
              SizedBox(
                height: 4,
              ),
              Center(child: Text(model.name)),
              // starText(model.rating, t7textColorSecondary)
            ],
          ),
        ),
      ],
    );
  }
}