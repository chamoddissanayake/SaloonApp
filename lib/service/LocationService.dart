import 'package:saloon_app/models/Location.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saloon_app/models/markerModel.dart';

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





Future<List<MarkersModel>> getAllLocationsForMap() async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _locationCollection = _firestore.collection('locations');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _locationCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    // Location loc = Location();

    // loc.loc_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    // loc.name = tmp.remove("name");
    // loc.description = tmp.remove("description");
    // loc.latitude = tmp.remove("latitude");
    // loc.longitude = tmp.remove("longitude");
    // loc.image = tmp.remove("image");



    // doc.id
    MarkersModel loc = MarkersModel(1, tmp.remove("name"), tmp.remove("description"), tmp.remove("latitude"), tmp.remove("longitude"), tmp.remove("image"));

    return loc;
  }).toList();
  return allData;
}



// (mBookingCanceled.location_id)


Future<Location> getLocationById(String locationId) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _locCollection = _firestore.collection('locations');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _locCollection.get();

  List<Location> allData;

  allData = querySnapshot.docs.map((doc)  {
    Location loc1 = new Location();

    if (locationId == doc.id){
      Map<String, Object> tmp = doc.data() as Map<String, Object>;

      loc1.loc_id = doc.id;

      loc1.name = tmp.remove("name");
      loc1.description = tmp.remove("description");
      loc1.image = tmp.remove("image");
      loc1.latitude = tmp.remove("latitude");
      loc1.longitude = tmp.remove("longitude");


      return loc1;
    }

  }).toList();

  List<Location> newList = [];

  for(var i = 0; i < allData.length; i++){
    if(allData[i]!= null){
      newList.add(allData[i]);
    }
  }

  return newList[0];
}



