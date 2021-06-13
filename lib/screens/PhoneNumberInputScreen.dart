import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/screens/VerificationInputScreen.dart';
class PhoneNumberInputScreen extends StatefulWidget {
  static const routeName = '/phone_number_input';

  @override
  _PhoneNumberInputScreenState createState() => _PhoneNumberInputScreenState();
}

class _PhoneNumberInputScreenState extends State<PhoneNumberInputScreen> {
  CustomUser signUpUserObj;
  String inputPhone ;

  @override
  Widget build(BuildContext context) {

    final signUpUserObj = ModalRoute.of(context).settings.arguments as CustomUser;

    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Text(signUpUserObj.email),
          (MediaQuery.of(context).orientation == Orientation.portrait)
              ? Container(
                  child: Image.asset(
                    "assets/images/phone_verification/otp.gif",
                    // height: 125.0,
                    // width: 125.0,
                  ),
                )
              : Container(),
          Container(
            child: Column(
              children: [
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    // print(phone.completeNumber);

                      this.inputPhone =  phone.completeNumber;


                  },
                  initialCountryCode: 'LK',
                ),
                SizedBox(
                  height: 30,
                ),
                NiceButton(
                  // width: 200,
                  icon: Icons.phone_android,
                  fontSize: 20,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "Send OTP Code",
                  background: Theme.of(context).primaryColor,
                  onPressed: () {

                    signUpUserObj.phone = this.inputPhone;

                    Navigator.pushNamed(
                      context,
                      VerificationInputScreen.routeName,
                      arguments: signUpUserObj,
                    );

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
