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


