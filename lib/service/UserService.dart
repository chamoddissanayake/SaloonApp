import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saloon_app/models/User.dart';

Future<User> validateUser(User inputUser) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('users');

  // print( _styleCollection.doc(styleId) );

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    User s1 = User();

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
  List<User> foundUser = List<User>();
  for(var i = 0; i < allData.length; i++){
    User  tempUsr = new User();

    if(allData[i].email == inputUser.email ){
      tempUsr.email = allData[i].email;
      if(allData[i].password == inputUser.password){
        tempUsr.password = allData[i].password;
      }
      foundUser.add(tempUsr);
    }
  }

  if (foundUser.length == 0){
    return new User();
  }else{
    return foundUser[0];
  }

}