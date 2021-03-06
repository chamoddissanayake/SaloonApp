import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/screens/MainScreen.dart';
import 'package:saloon_app/service/UserService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class VerificationInputScreen extends StatefulWidget {
  static const routeName = '/pin_verification';

  final String phoneNumber="0771234567";
  // VerificationInputScreen(this.phoneNumber);

  @override
  _VerificationInputScreenState createState() => _VerificationInputScreenState();
}

class _VerificationInputScreenState extends State<VerificationInputScreen> {
  var onTapRecognizer;
  CustomUser signUpUserObj;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();


  void pinCodeEnteredDone()async {

    print(this.signUpUserObj);
    print("---");
    addNewUserToDB();
  }

  void addNewUserToDB() async {
    print(this.signUpUserObj);

    addUser(this.signUpUserObj);
    _btnController.success();
    Navigator.of(context).pushReplacementNamed(MainScreen.routeName);


  }

  @override
  Widget build(BuildContext context) {

    this.signUpUserObj = ModalRoute.of(context).settings.arguments as CustomUser;

    return Scaffold(
      // backgroundColor: Colors.blue.shade50,
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              // Text(this.signUpUserObj.toString()),
              // Text(this.signUpUserObj.email),
              // Text(this.signUpUserObj.password),
              // Text(this.signUpUserObj.phone),
              SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: FlareActor(
                  "assets/images/pin_verification/otp.flr",
                  animation: "otp",
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                            text: this.signUpUserObj.phone,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 60,
                        fieldWidth: 50,
                        activeFillColor:
                        hasError ? Colors.orange : Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      textStyle: TextStyle(fontSize: 20, height: 1.6),
                      // backgroundColor: Colors.blue.shade50,
                      backgroundColor: Colors.white,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                    children: [
                      TextSpan(
                          text: " RESEND",
                          recognizer: onTapRecognizer,
                          style: TextStyle(
                              color: Color(0xFF91D3B3),
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ]),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                margin:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: RoundedLoadingButton(
                    child: Text('Done', style: TextStyle(color: Colors.white)),
                    controller: _btnController,
                    onPressed: pinCodeEnteredDone,
                  )
                  // child: FlatButton(
                  //   onPressed: () {
                  //    //goto Main
                  //
                  //
                  //     pinCodeEnteredDone();
                  //     //uncomment
                  //     // formKey.currentState.validate();
                  //     // // conditions for validating
                  //     // if (currentText.length != 6 || currentText != "towtow") {
                  //     //   errorController.add(ErrorAnimationType
                  //     //       .shake); // Triggering error shake animation
                  //     //   setState(() {
                  //     //     hasError = true;
                  //     //   });
                  //     // } else {
                  //     //   setState(() {
                  //     //     hasError = false;
                  //     //     scaffoldKey.currentState.showSnackBar(SnackBar(
                  //     //       content: Text("Aye!!"),
                  //     //       duration: Duration(seconds: 2),
                  //     //     ));
                  //     //   });
                  //     // }
                  //   },
                  //   child: Center(
                  //       child: Text(
                  //         "VERIFY".toUpperCase(),
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.bold),
                  //       )),
                  // ),





                ),
                // decoration: BoxDecoration(
                //     color: Colors.blue.shade300,
                //     borderRadius: BorderRadius.circular(25),
                //     boxShadow: [
                //       BoxShadow(
                //           color: Colors.blue.shade200,
                //           offset: Offset(1, -2),
                //           blurRadius: 5),
                //       BoxShadow(
                //           color: Colors.blue.shade200,
                //           offset: Offset(-1, 2),
                //           blurRadius: 5)
                //     ]),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text("Clear"),
                    onPressed: () {
                      textEditingController.clear();
                    },
                  ),
                  FlatButton(
                    child: Text("Set Text"),
                    onPressed: () {
                      textEditingController.text = "123456";
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );


  }
}
