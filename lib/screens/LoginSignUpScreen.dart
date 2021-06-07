import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/screens/HomeScreen.dart';
import 'package:saloon_app/screens/PhoneNumberInputScreen.dart';
import 'package:saloon_app/service/UserService.dart';
import 'package:saloon_app/utils/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/MainScreen.dart';
import 'package:saloon_app/utils/google/authentication.dart';
import 'package:saloon_app/utils/google/google_sign_in_button.dart';


const users = const {
  'aaa@gmail.com': 'aaa',
  'bbb@gmail.com': 'bbb',
};


class LoginSignupScreen extends StatefulWidget {
  static const routeName = '/login_sign_up';
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _loginUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    CustomUser inputUserObj = new CustomUser();
    inputUserObj.email = data.name;
    inputUserObj.password = data.password;

    CustomUser returnedUser = await validateUser(inputUserObj);

    if(returnedUser.email != inputUserObj.email){
      return 'Username not exists';
    }else{
      if(returnedUser.password == inputUserObj.password){
        addUserToSharedPreferenceCustom(returnedUser);
        return null;
        //Save state

      }else{
        return 'Password does not match';
      }
    }



    // return Future.delayed(loginTime).then((_) {
    //   if (!users.containsKey(data.name)) {
    //     return 'Username not exists';
    //   }
    //   if (users[data.name] != data.password) {
    //     return 'Password does not match';
    //   }
    //   return null;
    // });
  }

  Future<String> _signUpUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    CustomUser inputSignUpUserObj = new CustomUser();
    inputSignUpUserObj.email = data.name;
    inputSignUpUserObj.password = data.password;
    Future.delayed(Duration(milliseconds: 2000)).then((_) {
      // Navigator.of(context).pushReplacementNamed(PhoneNumberInputScreen.routeName);
      Navigator.pushNamed(
        context,
        PhoneNumberInputScreen.routeName,
        arguments: inputSignUpUserObj,
      );



    });

  }




  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: FlutterLogin(
            title: '',
            logo: 'assets/images/logo/logo.png',
            onLogin: _loginUser,
            onSignup: _signUpUser,
            theme: LoginTheme(

              buttonTheme: LoginButtonTheme(
                splashColor: Colors.lightBlue,
                backgroundColor: Colors.lightBlue,
                highlightColor: Colors.lightBlue,
                elevation: 5.0,
                highlightElevation: 6.0,
              ),



            ),
            onSubmitAnimationCompleted: () {

              // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
              //
            },
            onRecoverPassword: _recoverPassword,

            loginProviders: <LoginProvider>[
              LoginProvider(
                icon: FontAwesomeIcons.google,
                callback: () =>  googleLoginBtnPressed(),

                // LoginProvider(
                //   icon: FontAwesomeIcons.facebookF,
                //   callback: () async {
                //     print('start facebook sign in');
                //     await Future.delayed(loginTime);
                //     print('stop facebook sign in');
                //     return null;
                //   },
                // ),
              ),

            ],

          ),


        )

    );



  }

  void googleLoginPressed() {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.login();
  }

  Future<String> googleLoginBtnPressed() async {

    // setState(() {
    //   _isSigningIn = true;
    // });
    // print(context);
    User user =
       await  Authentication.signInWithGoogle(context: context);

    // setState(() {
    //   _isSigningIn = false;
    // });

    if (user != null) {

      addUserToSharedPreferenceGoogle(user);

      Navigator.pushReplacementNamed(
          context,
          MainScreen.routeName
      );
      return null;
    }
    return null;
  }

  void addUserToSharedPreferenceGoogle(User user) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('g_uid', user.uid);
    prefs.setString('g_email', user.email);
    prefs.setString('g_displayName', user.displayName);
    prefs.setString('g_photoURL', user.photoURL);

    prefs.setBool('is_google_logged_in', true);
    prefs.setBool('is_custom_logged_in', false);


  }

  void addUserToSharedPreferenceCustom(CustomUser user) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('c_obj_id', user.objId);
    prefs.setString('c_email', user.email);
    prefs.setString('c_password', user.password);
    prefs.setString('c_first_name', user.first_name);
    prefs.setString('c_last_name', user.last_name);
    prefs.setInt('c_gender', user.gender);
    prefs.setString('c_photo', user.photo);
    prefs.setString('c_phone', user.phone);

    prefs.setBool('is_google_logged_in', false);
    prefs.setBool('is_custom_logged_in', true);


  }
}
