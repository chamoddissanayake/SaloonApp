import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/models/TrendingStylesNum.dart';
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
    s1.styling_time = tmp.remove("styling_time");
    s1.short_description = tmp.remove("short_description");


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


Future<Categories> getCategoryById(String categoryId) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _categoriesCollection = _firestore.collection('categories');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _categoriesCollection.get();

  List<Categories> allData;

  allData = querySnapshot.docs.map((doc)  {
    Categories c = Categories();

    if (categoryId == doc.id){
      Map<String, Object> tmp = doc.data() as Map<String, Object>;
      c.cat_id = doc.id;
      c.name = tmp.remove("name");
      c.image = tmp.remove("image");

      return c;
    }

  }).toList();

  List<Categories> newList = [];

  for(var i = 0; i < allData.length; i++){
    if(allData[i]!= null){
      newList.add(allData[i]);
    }
    print("aa");
  }

return newList[0];
}



Future<TrendingStyles> getTrendingStyleById(String styleId) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _tsCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _tsCollection.get();

  List<TrendingStyles> allData;

  allData = querySnapshot.docs.map((doc)  {
    TrendingStyles ts1 = new TrendingStyles();

    if (styleId == doc.id){
      Map<String, Object> tmp = doc.data() as Map<String, Object>;

      ts1.sty_id = doc.id;
      ts1.name = tmp.remove("name");
      ts1.short_description = tmp.remove("short_description");
      ts1.price = tmp.remove("price");
      ts1.image = tmp.remove("image");
      ts1.description = tmp.remove("description");
      ts1.category_id = tmp.remove("category_id");
      ts1.styling_time = tmp.remove("styling_time");

      return ts1;
    }

  }).toList();

  List<TrendingStyles> newList = [];

  for(var i = 0; i < allData.length; i++){
    if(allData[i]!= null){
      newList.add(allData[i]);
    }
  }

  return newList[0];
}









Future<List<TrendingStyles>> getSortedTrendingResults_sortStyle(String selectedType) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();


  final allData = querySnapshot.docs.map((doc)  {
    TrendingStylesNum s1 = TrendingStylesNum();

    s1.sty_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    s1.name = tmp.remove("name");
    s1.price = double.parse(tmp.remove("price"));
    s1.image = tmp.remove("image");
    s1.description = tmp.remove("description");
    s1.category_id = tmp.remove("category_id");
    s1.styling_time = tmp.remove("styling_time");
    s1.short_description = tmp.remove("short_description");


    return s1;
  }).toList();
  print(allData);

  if (selectedType == "best_match"){
    return trendingStylesNumToTrendingStyles(allData);
  }else if(selectedType == "name"){
    allData.sort((a, b) => a.name.compareTo(b.name));
    return trendingStylesNumToTrendingStyles(allData);
  }else if(selectedType == "price_ascending"){
    allData.sort((a, b) => a.price.compareTo(b.price));
    return trendingStylesNumToTrendingStyles(allData);
  }else if(selectedType == "price_descending"){
    allData.sort((a, b) => a.price.compareTo(b.price));
    List<TrendingStylesNum> reversedList = new List.from(allData.reversed);
    return trendingStylesNumToTrendingStyles(reversedList);
  }else{
    return trendingStylesNumToTrendingStyles(allData);
  }



}

List<TrendingStyles> trendingStylesNumToTrendingStyles(List<TrendingStylesNum> allData){

  List<TrendingStyles> tempListOfTrendingStyles= new List<TrendingStyles>();
  for(var i = 0; i < allData.length; i++){
    TrendingStyles ts = new TrendingStyles();

    ts.sty_id = allData[i].sty_id;
    ts.name = allData[i].name;
    ts.price = allData[i].price.toStringAsFixed(2);
    ts.image = allData[i].image;
    ts.description = allData[i].description;
    ts.category_id = allData[i].category_id;
    ts.styling_time = allData[i].styling_time;
    ts.short_description = allData[i].short_description;

    tempListOfTrendingStyles.add(ts);
  }
  return tempListOfTrendingStyles;
}



//

Future<List<TrendingStyles>> getSortedTrendingResults_sortCategory(String selectedType, String selectedCategory) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();


  final allData = querySnapshot.docs.map((doc)  {
    TrendingStylesNum s1 = TrendingStylesNum();

    s1.sty_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    s1.name = tmp.remove("name");
    s1.price = double.parse(tmp.remove("price"));
    s1.image = tmp.remove("image");
    s1.description = tmp.remove("description");
    s1.category_id = tmp.remove("category_id");
    s1.styling_time = tmp.remove("styling_time");
    s1.short_description = tmp.remove("short_description");


    if(s1.category_id == selectedCategory){
      return s1;
    }else{
      return null;
    }

  }).toList();
  print(allData);

  allData.removeWhere((value) => value == null);
  print(allData);

  if (selectedType == "best_match"){
    return trendingStylesNumToTrendingStyles(allData);
  }else if(selectedType == "name"){
    allData.sort((a, b) => a.name.compareTo(b.name));
    return trendingStylesNumToTrendingStyles(allData);
  }else if(selectedType == "price_ascending"){
    allData.sort((a, b) => a.price.compareTo(b.price));
    return trendingStylesNumToTrendingStyles(allData);
  }else if(selectedType == "price_descending"){
    allData.sort((a, b) => a.price.compareTo(b.price));
    List<TrendingStylesNum> reversedList = new List.from(allData.reversed);
    return trendingStylesNumToTrendingStyles(reversedList);
  }else{
    return trendingStylesNumToTrendingStyles(allData);
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
    s1.styling_time = tmp.remove("styling_time");
    s1.short_description = tmp.remove("short_description");


    return s1;
  }).toList();
  return allData;
}



Future<List<TrendingStyles>> getAllTrendingStylesForAGivenCategory(String currentCatId) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  List<TrendingStyles> allData;

  allData = querySnapshot.docs.map((doc)  {
    TrendingStyles s1 = TrendingStyles();

    s1.sty_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;
    s1.name = tmp.remove("name");
    s1.price = tmp.remove("price");
    s1.image = tmp.remove("image");
    s1.description = tmp.remove("description");
    s1.category_id = tmp.remove("category_id");
    s1.styling_time = tmp.remove("styling_time");
    s1.short_description = tmp.remove("short_description");

    return s1;
  }).toList();

  List<TrendingStyles> newSelectedCategoryStylesList = [];
  for(var i = 0; i < allData.length; i++){
    if(allData[i].category_id == currentCatId){
      newSelectedCategoryStylesList.add(allData[i]);
    }
  }

  return newSelectedCategoryStylesList;
}




Future<TrendingStyles> getATrendingStyle(String styleId) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  List<TrendingStyles> allData;

  allData = querySnapshot.docs.map((doc)  {
    TrendingStyles s1 = TrendingStyles();

    if (styleId==doc.id){
      Map<String, Object> tmp = doc.data() as Map<String, Object>;
      s1.name = tmp.remove("name");
      s1.price = tmp.remove("price");
      s1.image = tmp.remove("image");
      s1.description = tmp.remove("description");
      s1.category_id = tmp.remove("category_id");

      s1.styling_time = tmp.remove("styling_time");
      s1.short_description = tmp.remove("short_description");

      return s1;
    };

  }).toList();
  List<TrendingStyles> newList = [];
  for(var i = 0; i < allData.length; i++){
    if(allData[i]!= null){
      newList.add(allData[i]);
    }
    print("aa");
  }

  return newList[0];

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

        s1.name = tempName;
        s1.price = tmp.remove("price");
        s1.image = tmp.remove("image");
        s1.description = tmp.remove("description");
        s1.category_id = tmp.remove("category_id");

        return s1;

    }
  }).takeWhile((value) => (value.name.toLowerCase().contains(searchKeyword.toLowerCase()))).toList();
  return allData;

}

