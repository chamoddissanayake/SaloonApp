import 'package:flutter/material.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50.0),
      //   child:AppBarWidget() ,
      // ),
      // drawer: Drawer(
      //   child: SingleChildScrollView(child: MainDrawer()),
      // ),

      body: Column(
        children: [
          Text("aaa"),
          Text("aaa"),
          Text("aaa"),
          Text("aaa"),
          Text("aaa"),

        ],
      ),
    );
  }
}
