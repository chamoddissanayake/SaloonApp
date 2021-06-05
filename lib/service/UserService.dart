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