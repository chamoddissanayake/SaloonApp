import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/utils/PriceUtils.dart';

import 'CustomTextWidget.dart';

Widget searchResultCardWidget(String image, String name, String price ) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10 , 0, 10),
        child: Row(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: image,
                height: 100,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextWidget(name, fontSize: 20.0, fontWeight: FontWeight.bold),
                  Row(
                    children: [
                      customTextWidget("\$ "+price, fontSize: 18.0),
                      SizedBox(width: 10,),
                      customTextWidget(
                          "\$ "+PriceUtils.getFullPrice(price),
                          textColor: Colors.red,
                          fontSize: 15.0,
                          lineThrough: true),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );

}