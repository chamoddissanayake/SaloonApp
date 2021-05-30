import 'package:saloon_app/models/Location.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Location>> getAllLocations() async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _locationCollection = _firestore.collection('locations');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _locationCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    Location loc = Location();

    loc.loc_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    loc.name = tmp.remove("name");
    loc.description = tmp.remove("description");
    loc.latitude = tmp.remove("latitude");
    loc.longitude = tmp.remove("longitude");
    loc.image = tmp.remove("image");


    return loc;
  }).toList();
  return allData;
}




// List<Location> getAllLocations() {
//   List<Location> allLocationData = List<Location>();
//
//   Location model1 = Location();
//   model1.name = "Gampaha";
//   model1.description = "Lorem ipsum is a dummy text";
//   model1.latitude = "7.093183";
//   model1.longitude = "79.993691";
//   model1.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fmap%2Fgampaha.png?alt=media&token=e44a584c-b351-42cb-bfaa-ecadbdff6d97";
//
//   Location model2 = Location();
//   model2.name = "Kandy";
//   model2.description = "Lorem ipsum is a dummy text";
//   model2.latitude = "7.293288";
//   model2.longitude = "80.634956";
//   model2.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fmap%2Fkandy.jpg?alt=media&token=5cec7eb6-bd5d-4f23-b624-ccb38c7c73ca";
//
//
//   Location model3 = Location();
//   model3.name = "Galle";
//   model3.description = "Lorem ipsum is a dummy text";
//   model3.latitude = "6.032733";
//   model3.longitude = "80.215808";
//   model3.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fmap%2Fgalle.jpg?alt=media&token=f82db99d-6d7a-44d5-8950-df492fac5958";
//
//
//   Location model4 = Location();
//   model4.name = "Matara";
//   model4.description = "Lorem ipsum is a dummy text";
//   model4.latitude = "5.942960";
//   model4.longitude = "80.551020";
//   model4.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fmap%2Fmatara.jpg?alt=media&token=ca733c7e-df31-4a50-b709-9b5d51ad12d5";
//
//
//   Location model5 = Location();
//   model5.name = "Colombo";
//   model5.description = "Lorem ipsum is a dummy text";
//   model5.latitude = "6.933454";
//   model5.longitude = "79.865896";
//   model5.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fmap%2Fcolombo.jpg?alt=media&token=3eec65ed-32fc-4904-9043-f00708998076";
//
//   allLocationData.add(model1);
//   allLocationData.add(model2);
//   allLocationData.add(model3);
//   allLocationData.add(model4);
//   allLocationData.add(model5);
//   return allLocationData;
// }
//
//
