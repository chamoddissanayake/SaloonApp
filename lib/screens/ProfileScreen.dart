import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:saloon_app/screens/LoadingScreen.dart';
import 'package:saloon_app/screens/LoginSignUpScreen.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/utils/google/authentication.dart';
import 'package:saloon_app/screens/LoginSignUpScreen.dart';
import 'package:saloon_app/widgets/CustomBackIcon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool genderMale = true;
  bool genderFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.deepOrange, Colors.pinkAccent])),
                child: Container(
                  width: double.infinity,
                  height: 320.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                customBackIcon(
                                    Colors.white, Icons.keyboard_arrow_left, Colors.grey, context)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
                                    ),
                                    radius: 80.0,
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Abc Defg",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        labelText: 'Phone',
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        customTextWidget("Gender", fontSize: 17.0),
                        Container(
                            color: genderFemale ? Colors.black12: Colors.transparent,
                            child: Image.asset(
                              "assets/images/bottom_bar/girl_haircut.png",
                              height: 45,
                              width: 45,
                            )),
                        Container(
                          color: genderMale ? Colors.black12: Colors.transparent,
                          child: Image.asset(
                            "assets/images/bottom_bar/boy_haircut.png",
                            height: 45,
                            width: 45,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                        child:
                            customTextWidget("Reset Password", fontSize: 17.0)),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(onTap: (){

                      logoutPressed();


                    },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: customTextWidget("Logout",
                              textColor: Colors.white,
                              isCentered: true,
                              fontWeight: FontWeight.bold,
                              textAllCaps: true),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(25),
                            // bgColor: widget.bgColor,
                            // radius: 6
                          )),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                        child: customTextWidget("Delete My Account",
                            textColor: Colors.white,
                            isCentered: true,
                            fontWeight: FontWeight.bold,
                            textAllCaps: true),
                        decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(25),
                          // bgColor: widget.bgColor,
                          // radius: 6
                        )),
                  ],
                ),
              ),
            ),
            // Container(
            //   child: Text('This element must stay at the bottom'),
            //   height: ,
            // ),
            SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }

  void logoutPressed() async{



    Future<SharedPreferences> _prefGUser = SharedPreferences.getInstance();
    final SharedPreferences prefGUser = await _prefGUser;


    // setState(() {
    //   _isSigningOut = true;
    // });
    await Authentication.signOut(context: context);
    // setState(() {
    //   _isSigningOut = false;
    // });

    // // prefGUser.getString('uid');
    // // prefGUser.getString('email');
    // // prefGUser.getString('displayName');
    // // prefGUser.getString('photoURL');
    //
    //

    // Navigator.of(context).pushReplacementNamed(LoginSignupScreen.routeName);
    // Navigator.of(context).pushReplacement(_routeToSignInScreen());
    // Navigator.push(context, new MaterialPageRoute(
    //     builder: (context) => new LoginSignupScreen())
    // );
    FlutterRestart.restartApp();

  }

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginSignupScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}



