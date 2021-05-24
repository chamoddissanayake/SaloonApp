import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const users = const {
  'aaa@gmail.com': 'aaa',
  'bbb@gmail.com': 'bbb',
};


class LoginSignupScreen extends StatefulWidget {
  static const routeName = '/login_signup';
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
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
          // padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: FlutterLogin(
            title: '',
            logo: 'assets/images/logo/logo.png',
            onLogin: _authUser,
            onSignup: _authUser,
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
              // Navigator.of(context).pushReplacementNamed(AppIntro.routeName);
              // Navigator.of(context).pushReplacementNamed(PinCodeVerificationScreen.routeName);
              // Navigator.of(context).pushReplacementNamed(PhoneNumberInputScreen.routeName);

            },
            onRecoverPassword: _recoverPassword,

            loginProviders: <LoginProvider>[
              LoginProvider(
                icon: FontAwesomeIcons.google,
                callback: () async {
                  print('start google sign in');
                  await Future.delayed(loginTime);
                  print('stop google sign in');
                  return null;
                },
              ),
              LoginProvider(
                icon: FontAwesomeIcons.facebookF,
                callback: () async {
                  print('start facebook sign in');
                  await Future.delayed(loginTime);
                  print('stop facebook sign in');
                  return null;
                },
              ),
            ],

          ),
        )

    );

  }
}
