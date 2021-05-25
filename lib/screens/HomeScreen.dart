import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagelist = [
    "https://drive.google.com/uc?export=view&id=1dqCbX6fW7LeSi6YTdlpaQMkxow1QqurG",
    "https://drive.google.com/uc?export=view&id=1mRh8DolV1V70NCCW-OxLfVYZ6yuxiVkg",
    "https://drive.google.com/uc?export=view&id=1kzmMBrGVGeYa7Fb6SDPcWrmfhpvIcvOf",
    "https://drive.google.com/uc?export=view&id=1gQe7TXOiS3SHHb4Wq_m2jW8ZZ48VGp0Z",
    "https://drive.google.com/uc?export=view&id=1cZp4vgoVJCvvgcgc0H5bOmHZKHW47KUr"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child:AppBarWidget() ,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(child: MainDrawer()),
      ),

      body: Container(
        child: Column(
          children: [
            Text(""),
            CarouselSlider(
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
                    Image.network(e,width: 1000,height: 200,fit: BoxFit.cover,)
                  ],
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
