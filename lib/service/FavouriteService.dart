import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/Favourite.dart';
import 'package:saloon_app/utils/transformer.dart';

/*
* Bandara A.B.C.N
* IT18117356
* Favourite Service
*/

class FavouriteService {
  static Future<String> createFavourite(Favourite favourite) async {
    // create a firebase doc
    final docFavourite =
        FirebaseFirestore.instance.collection('favourite').doc();

    // doc id to assign the favourite model
    favourite.id = docFavourite.id;

    // create a favourite
    await docFavourite.set(favourite.toJson());

    return docFavourite.id;
  }

  static Future<List<Favourite>> readFavourites() async {
    // firebase instance
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    // collection referance
    final CollectionReference _locationCollection =
        _firestore.collection('favourite');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _locationCollection.get();

    // convert json list into Favourite object list
    final favourites = querySnapshot.docs.map((element) {
      return Favourite(
          id: element['id'],
          title: element['title'],
          user_id: element['user_id'],
          style_id: element['style_id']);
    }).toList();

    // return the object list
    return favourites;
  }

  static Future deleteTodo(Favourite favourite) async {
    // the firestore doc
    final docFavourite =
        FirebaseFirestore.instance.collection('favourite').doc(favourite.id);

    // remove the given object form the doc
    await docFavourite.delete();
  }
}
