import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/Categories.dart';
import 'package:saloon_app/widgets/CustomTitleSeeAllWidget.dart';

class categories extends StatelessWidget {
  Categories model;

  categories(Categories mCategories, int index){
    this.model = mCategories;
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16),
          width: width * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: model.image,
                  height: width * 0.28,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              //text(model.name),
              SizedBox(
                height: 4,
              ),
              Center(child: customTitleSeeAllWidget(model.name, fontWeight: FontWeight.bold)),
              // starText(model.rating, t7textColorSecondary)
            ],
          ),
        ),
      ],
    );
  }
}