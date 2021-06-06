import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/models/GoogleUser.dart';
import 'package:saloon_app/screens/MapScreen.dart';
import 'package:saloon_app/screens/ProfileScreen.dart';
import 'package:saloon_app/service/UserService.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  GoogleUser gu;
  CustomUser cu;
  String userType;
  String defaultImage =
      "https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";

  @override
  void initState() {
    super.initState();
    getcurrentUserData();

    print(this.gu);
    print(this.cu);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ProfileScreen()));
                },
                child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: this.userType == null
                        ? NetworkImage(defaultImage)
                        : (this.userType == 'G')
                            ? NetworkImage(gu.photoURL)
                            : (this.userType == 'C')
                                ? NetworkImage(cu.photo)
                                : Container()),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                this.userType == null? "":(this.userType == 'G')? ""+gu.displayName:(this.userType == 'C')? ""+cu.first_name+" "+cu.last_name:"",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              // Text(
              //   "Premium Member",
              //   style: TextStyle(
              //     fontSize: 16.0,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it

      Divider(),
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Your Profile"),
      ),

      Divider(),
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.inbox,
          color: Colors.black,
        ),
        title: Text("Inbox"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.assessment,
          color: Colors.black,
        ),
        title: Text("Your Dashboard"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text("Settings"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.business,
          color: Colors.black,
        ),
        title: Text("About Us"),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.phone,
          color: Colors.black,
        ),
        title: Text("Contact Us"),
      ),
    ]);
  }

  void getcurrentUserData() async {
    if (await UtilFunctions.isCurrentUserGoogle() == true) {
      this.userType = 'G';
      this.gu = await UtilFunctions.getSharedStorageGoogleUser();
      print(this.gu);
      this.setState(() {});
    } else if (await UtilFunctions.isCurrentUserGoogle() == false) {
      this.userType = 'C';
      this.cu = await UtilFunctions.getSharedStorageCustomUser();
      print(this.cu);
      CustomUser tempCusUser ;
      tempCusUser = await getCurrentUser(this.cu.email);
      this.cu = tempCusUser;
      print(this.cu);
      this.setState(() {});
    }
  }
}
