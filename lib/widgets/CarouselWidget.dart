import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    final List<String> imagelist = [
      // "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcarousel%2Fimg%20(3).jpg?alt=media&token=fc387c4c-6935-4b11-a3f4-85829928f7ac",
      // "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcarousel%2Fimg%20(1).jpg?alt=media&token=4e89ed26-31c0-4843-a0ee-9a264e849b36",
      // "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcarousel%2Fimg%20(2).jpg?alt=media&token=5d1f890e-3cfd-4cd1-ad05-f4a1cf7eb229",
      // "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcarousel%2Fimg%20(4).jpg?alt=media&token=190e2427-b409-4e1a-8a99-72dec81692b3",
      // "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcarousel%2Fimg%20(5).jpg?alt=media&token=6c9378a4-cdcb-48b6-9e74-d4fe54672f75"
      "assets/images/carousel/img1.jpg",
      "assets/images/carousel/img2.jpg",
      "assets/images/carousel/img3.jpg",
      "assets/images/carousel/img4.jpg",
      "assets/images/carousel/img5.jpg"

    ];

    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: true
      ),
      items: imagelist.map((e) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Image.network(e,width: 1000,height: 200,fit: BoxFit.cover,)
            Image.asset(e,width: 1000, height: 200, fit: BoxFit.cover,)
          ],
        ),
      )).toList(),
    );
  }
}
