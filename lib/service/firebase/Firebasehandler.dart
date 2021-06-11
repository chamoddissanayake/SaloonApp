import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';



class Firebasehandler{


  static Future<bool> takePhotoOrChooseAndUpload()async{
    //
    // final picker = ImagePicker();
    //   File _imageFile;
    //   final pickedFile = await picker.getImage(source: ImageSource.camera);
    //   _imageFile = File(pickedFile.path);
    //
    //  await uploadImage(_imageFile);
     await uploadImage();
  }

  static Future<bool> uploadImage() async {
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
            .child('images/imageName')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        // setState(() {
        //   imageUrl = downloadUrl;
        // });
        print(downloadUrl);
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }

}


