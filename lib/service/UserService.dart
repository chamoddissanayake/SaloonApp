import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saloon_app/models/CustomUser.dart';

Future<CustomUser> validateUser(CustomUser inputUser) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('users');

  // print( _styleCollection.doc(styleId) );

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    CustomUser s1 = CustomUser();

    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    s1.objId = doc.id;
    s1.email = tmp.remove("email");
    s1.password = tmp.remove("password");
    s1.first_name = tmp.remove("first_name");
    s1.last_name = tmp.remove("last_name");
    s1.gender = tmp.remove("gender");
    s1.photo = tmp.remove("photo");

    return s1;
  }).toList();

  print(allData);
  List<CustomUser> foundUser = List<CustomUser>();
  for(var i = 0; i < allData.length; i++){
    CustomUser  tempUsr = new CustomUser();

    if(allData[i].email == inputUser.email ){
      tempUsr.objId = allData[i].objId;
      tempUsr.email = allData[i].email;
      if(allData[i].password == inputUser.password){
        tempUsr.password = allData[i].password;
      }
      foundUser.add(tempUsr);
    }
  }

  if (foundUser.length == 0){
    return new CustomUser();
  }else{
    return foundUser[0];
  }

}


Future<CustomUser> getCurrentUser(String inputEmail) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('users');

  QuerySnapshot querySnapshot = await _styleCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    CustomUser s1 = CustomUser();

    Map<String, Object> tmp = doc.data() as Map<String, Object>;

    s1.objId = doc.id;
    s1.email = tmp.remove("email");
    s1.password = tmp.remove("password");
    s1.first_name = tmp.remove("first_name");
    s1.last_name = tmp.remove("last_name");
    s1.gender = tmp.remove("gender");
    s1.photo = tmp.remove("photo");
    s1.phone = tmp.remove("phone");

    return s1;
  }).toList();

  print(allData);

  List<CustomUser> foundUser = List<CustomUser>();
  for(var i = 0; i < allData.length; i++){
    CustomUser  tempUsr = new CustomUser();

    if(allData[i].email == inputEmail ){
      tempUsr.objId = allData[i].objId;
      tempUsr.email = allData[i].email;
      tempUsr.first_name = allData[i].first_name;
      tempUsr.last_name= allData[i].last_name;
      tempUsr.gender= allData[i].gender;
      tempUsr.password= allData[i].password;
      tempUsr.phone= allData[i].phone;
      tempUsr.photo= allData[i].photo;

      foundUser.add(tempUsr
      );
    }
  }

  if (foundUser.length == 0){
    return new CustomUser();
  }else{
    return foundUser[0];
  }

}



Future<bool> addUser(CustomUser newUser) async {

      CollectionReference users = FirebaseFirestore.instance.collection('users');
      return users.add({
        "email": newUser.email,
        "first_name":"",
        "gender": 0,
        "last_name": "",
        "password": newUser.password,
        "phone": newUser.phone,
        "photo":""
      })
          .then((value) {
            print("User Added");
          } )
          .catchError((error) {
            print("Failed to add user: $error");
          }
      );


}




Future<bool> updateUser(CustomUser user) async {

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final CollectionReference _styleCollection = _firestore.collection('users');

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('users');

  _styleCollection.doc(user.objId).update({
    "email": user.email,
    "first_name": user.first_name,
    "gender": user.gender,
    "last_name": user.last_name,
    "password": user.password,
    "phone": user.phone,
    "photo": user.photo
  }).then((_) {
    print("update success!");
    return true;
  });

}



Future<bool> deleteUser(CustomUser user) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('users');

  _styleCollection.doc(user.objId).delete().then((_) {
    print("delete success!");
    return true;
  });

}