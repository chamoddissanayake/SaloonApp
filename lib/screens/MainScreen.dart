import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saloon_app/screens/BookingScreen.dart';
import 'package:saloon_app/screens/HomeScreen.dart';
import 'package:saloon_app/screens/FavouritesScreen.dart';
import 'package:saloon_app/screens/OffersScreen.dart';


class MainScreen extends StatefulWidget {
  static const routeName = '/main';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool gender = true;
  // false = female  , true = male

  List<Widget> _buildScreens() {
    return [
      // MainScreen(),
      // SettingsScreen()
      HomeScreen(),
      BookingScreen(),
      FavouritesScreen(),
      OffersScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: new Image.asset("assets/images/bottom_bar/house.png" ),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        // icon: Icon(CupertinoIcons.add_circled_solid),
        icon: gender? new Image.asset("assets/images/bottom_bar/girl_haircut.png"): new Image.asset("assets/images/bottom_bar/boy_haircut.png"),
        title: ("Booking"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon:new Image.asset("assets/images/bottom_bar/favourites.png"),
        title: ("Favourites"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: new Image.asset("assets/images/bottom_bar/offer.png"),
        title: ("Offers"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
      ),
    ];
  }




  @override
  Widget build(BuildContext context) {

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarHeight: 70,
      backgroundColor: Colors.white54, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 10),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );


  }
}
