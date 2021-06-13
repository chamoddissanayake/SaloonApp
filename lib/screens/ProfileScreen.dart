import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';



import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/models/GoogleUser.dart';
import 'package:saloon_app/screens/LoadingScreen.dart';
import 'package:saloon_app/screens/LoginSignUpScreen.dart';
import 'package:saloon_app/service/UserService.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/utils/google/authentication.dart';
import 'package:saloon_app/service/firebase/Firebasehandler.dart';
import 'package:saloon_app/widgets/CustomBackIcon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  GoogleUser gu;
  CustomUser cu;
  String userType;
  String defaultImage =
      "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fusers%2Fuser.png?alt=media&token=50751901-d400-4da1-bddf-3d9009a6248f";


  bool _validate_first_name = false;
  bool _validate_last_name = false;
  bool _validate_email = false;
  bool _validate_phone = false;

  @override
  void initState() {
    super.initState();

    getcurrentUserData();
    // firebase.auth().signInAnonymously();
    FirebaseAuth.instance.signInAnonymously();
    print(this.gu);
  }

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
                                //   CircleAvatar(
                                //     backgroundImage: this.userType == null ? NetworkImage(defaultImage) : (this.userType == 'G')
                                // ? NetworkImage(gu.photoURL)
                                // : (this.userType == 'C')
                                // ? NetworkImage(cu.photo)
                                // : NetworkImage(defaultImage),
                                //     radius: 80.0,
                                //   ),
                                  CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage: this.userType == null ? AssetImage("assets/images/user/user.png")
                                          : (this.userType == 'G')
                                          ? gu.photoURL!=""?NetworkImage(gu.photoURL):AssetImage("assets/images/user/user.png")
                                          : (this.userType == 'C')
                                          ? cu.photo!=""?NetworkImage(cu.photo):AssetImage("assets/images/user/user.png")
                                          : Container()),
                                  cu != null? Container(
                                    child: GestureDetector(
                                      onTap: (){
                                        editPressed();
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ),
                                  ):Container(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              this.userType == null ? "": (this.userType == 'G') ? gu.displayName: (this.userType == 'C')? cu.first_name+ " " +cu.last_name
                                  : Container(),
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
            this.cu !=null ? Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    TextField(
                      onChanged: (value) {
                          value.isEmpty ? _validate_first_name = true : _validate_first_name = false;
                          this.cu.first_name  = value;
                      },
                      decoration: InputDecoration(
                        errorText:  _validate_first_name ? 'First name Can\'t Be Empty' : null,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        labelText: cu.first_name,
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      onChanged: (value) {
                        value.isEmpty ? _validate_last_name = true : _validate_last_name = false;
                        this.cu.last_name  = value;
                      },
                      decoration: InputDecoration(
                        errorText:  _validate_last_name ? 'Last name Can\'t Be Empty' : null,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        labelText: cu.last_name,
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      onChanged: (value) {
                        value.isEmpty ? _validate_email = true : _validate_email = false;
                        this.cu.email  = value;
                      },
                      decoration: InputDecoration(
                        errorText:  _validate_email ? 'Email Can\'t Be Empty' : null,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        labelText: cu.email,
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      onChanged: (value) {
                        value.isEmpty ? _validate_phone = true : _validate_phone = false;
                        this.cu.phone  = value;
                      },
                      decoration: InputDecoration(
                        errorText:  _validate_phone ? 'Phone Can\'t Be Empty' : null,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        labelText: cu.phone,
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
                        GestureDetector(
                          onTap: (){
                            this.setState(() {
                              cu.gender = 0;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color:  cu != null? cu.gender==0 ? Colors.black12: Colors.transparent: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),

                              // color: cu != null? cu.gender==0 ? Colors.black12: Colors.transparent: Colors.transparent,
                              child: Image.asset(
                                "assets/images/bottom_bar/girl_haircut.png",
                                height: 45,
                                width: 45,
                              )

                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            this.setState(() {
                              cu.gender = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: cu != null? cu.gender==1 ? Colors.black12: Colors.transparent: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              "assets/images/bottom_bar/boy_haircut.png",
                              height: 45,
                              width: 45,
                            ),
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
                      updatePressed();
                    },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: customTextWidget("Update",
                              textColor: Colors.white,
                              isCentered: true,
                              fontWeight: FontWeight.bold,
                              textAllCaps: true),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(25),
                            // bgColor: widget.bgColor,
                            // radius: 6
                          )),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        deleteBtnPressed();
                      },
                      child: Container(
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
                    ),
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
                  ],
                ),
              ),
            ):Container(),




            this.gu !=null ? Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),


                    Center(child: customTextWidget(gu.email, fontSize: 17.0, fontWeight: FontWeight.bold)),
                    // customTextWidget(gu.displayName),

                    SizedBox(
                      height: 30.0,
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
                  ],
                ),
              ),
            ):Container(),



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

    Future<SharedPreferences> _prefUser = SharedPreferences.getInstance();
    final SharedPreferences prefUser = await _prefUser;

    if(prefUser.getBool('is_google_logged_in')){
      //Google user

      print("-----------------");
      print(prefUser.getString('g_uid'));
      print(prefUser.getString('g_email'));
      print(prefUser.getString('g_displayName'));
      print(prefUser.getString('g_photoURL'));
      print("^^^^^^^^^^^^^^^^^^^^");

      prefUser.setString('g_uid', '');
      prefUser.setString('g_email', '');
      prefUser.setString('g_displayName', '');
      prefUser.setString('g_photoURL', '');

      prefUser.setBool('is_google_logged_in', false);
      prefUser.setBool('is_custom_logged_in', false);

      await Authentication.signOut(context: context);

    }else if(prefUser.getBool('is_custom_logged_in')){
      // Custom user
      prefUser.setString('c_email', "");
      prefUser.setString('c_password', "");
      prefUser.setString('c_first_name', "");
      prefUser.setString('c_last_name', "");
      prefUser.setInt('c_gender', 0);
      prefUser.setString('c_photo', "");
      prefUser.setString('c_phone', "");

      prefUser.setBool('is_google_logged_in', false);
      prefUser.setBool('is_custom_logged_in', false);

    }

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

  void getcurrentUserData() async{
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

  void updatePressed()async {
    // print(this.cu);
    bool update_status = await updateUser(this.cu);

    CoolAlert.show(
      backgroundColor: Color(0xFFFF9F9F),
      context: context,
      type: CoolAlertType.success,
      text: "Your account updated successfully.",
    );
  }

  void deleteBtnPressed() {


    CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      text: 'Do you want to delete your account?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.red,
      onConfirmBtnTap: conformedTapped
    );

  }

  // cancelTapped() {}

  conformedTapped() async{
    await deleteUser(this.cu);
    CoolAlert.show(
      backgroundColor: Color(0xFFFFDEC1),
      context: context,
      type: CoolAlertType.success,
      text: "Your account deleted successfully.",
    ).then((value) {
      FlutterRestart.restartApp();
    } );
  }


  File _imageFile;
  void editPressed() async {
    // await Firebasehandler.takePhotoOrChooseAndUpload();

    Future_showChoiceDialog(context);

  }

  PickedFile imageFile;
  void _openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    setState(() {
      imageFile = pickedFile;
    });
    uploadImageToFirebase(context);

  }


  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      imageFile = pickedFile;
    });
    uploadImageToFirebase(context);



  }


  Future_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {

    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = await _imagePicker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _firebaseStorage.ref()
            .child('images/'+(DateTime.now().millisecondsSinceEpoch).toString()+".jpg")
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          print(downloadUrl);
          print(this.cu);
          this.updatePhotoPath(downloadUrl);
          print("-----");
          Navigator.pop(context);
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }


  void updatePhotoPath(String downloadUrl)async {

    // print(this.cu);
    bool photo_update_status = await updateUserPhoto(this.cu, downloadUrl);

    this.setState(() { });
    CoolAlert.show(
      backgroundColor: Color(0xFFFF9F9F),
      context: context,
      type: CoolAlertType.success,
      text: "Photo Your Photo successfully.",
      onConfirmBtnTap: confirmInPhotoUpdateSuccessPressed,
    ).then((value) => this.setState(() {  }));
  }

  void confirmInPhotoUpdateSuccessPressed(){
    this.setState(() { });
  }






}