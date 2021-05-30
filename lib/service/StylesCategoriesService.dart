import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/models/Categories.dart';

Future<List<TrendingStyles>> getTrendingStyles() async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
  TrendingStyles s1 = TrendingStyles();

  s1.sty_id=doc.id;
      Map<String, Object> tmp = doc.data() as Map<String, Object>;
    s1.name = tmp.remove("name");
    s1.price = tmp.remove("price");
    s1.image = tmp.remove("image");
    s1.description = tmp.remove("description");
    s1.category_id = tmp.remove("category_id");

  return s1;
  }).toList();
  return allData;
}



Future<List<Categories>> getCategories() async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _categoriesCollection = _firestore.collection('categories');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _categoriesCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    Categories c = Categories();

    c.cat_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    c.name = tmp.remove("name");
    c.image = tmp.remove("image");

    return c;
  }).toList();
  return allData;
}


Future<List<Categories>> getAllCategories() async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _categoriesCollection = _firestore.collection('categories');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _categoriesCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    Categories c = Categories();

    c.cat_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    c.name = tmp.remove("name");
    c.image = tmp.remove("image");

    return c;
  }).toList();
  return allData;
}


Future<List<TrendingStyles>> getSortedTrendingResults(String selectedType) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();


  final allData = querySnapshot.docs.map((doc)  {
    TrendingStyles s1 = TrendingStyles();

    s1.sty_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    s1.name = tmp.remove("name");
    s1.price = tmp.remove("price");
    s1.image = tmp.remove("image");
    s1.description = tmp.remove("description");
    s1.category_id = tmp.remove("category_id");

    return s1;
  }).toList();

  if (selectedType == "best_match"){
    return allData;
  }else if(selectedType == "name"){
    allData.sort((a, b) => a.name.compareTo(b.name));
    return allData;
  }else if(selectedType == "price_ascending"){
    allData.sort((a, b) => a.price.compareTo(b.price));
    return allData;
  }else if(selectedType == "price_descending"){
    allData.sort((a, b) => a.price.compareTo(b.price));
    List<TrendingStyles> reversedList = new List.from(allData.reversed);
    return reversedList;
  }else{
    return allData;
  }

}


Future<List<TrendingStyles>> getAllTrendingStyles() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    TrendingStyles s1 = TrendingStyles();

    s1.sty_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    s1.name = tmp.remove("name");
    s1.price = tmp.remove("price");
    s1.image = tmp.remove("image");
    s1.description = tmp.remove("description");
    s1.category_id = tmp.remove("category_id");

    return s1;
  }).toList();
  return allData;
}





Future<List<TrendingStyles>> getATrendingStyle(String styleId) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  print( _styleCollection.doc(styleId) );

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    TrendingStyles s1 = TrendingStyles();

    s1.sty_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    s1.name = tmp.remove("name");
    s1.price = tmp.remove("price");
    s1.image = tmp.remove("image");
    s1.description = tmp.remove("description");
    s1.category_id = tmp.remove("category_id");

    return s1;
  }).toList();
  return allData;
}




Future<List<TrendingStyles>> getATrendingStyleForSearch(String searchKeyword) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  final allData = querySnapshot.docs.map((doc)  {
    TrendingStyles s1 = TrendingStyles();

    s1.sty_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;

    if(searchKeyword == ""){
      s1.name = tmp.remove("name");
      s1.price = tmp.remove("price");
      s1.image = tmp.remove("image");
      s1.description = tmp.remove("description");
      s1.category_id = tmp.remove("category_id");

      return s1;
    }else{
      String tempName = tmp.remove("name");
      if(tempName.contains(searchKeyword)){
        s1.name = tempName;
        s1.price = tmp.remove("price");
        s1.image = tmp.remove("image");
        s1.description = tmp.remove("description");
        s1.category_id = tmp.remove("category_id");

        return s1;
      }

    }


  }).toList();
  return allData;

}

