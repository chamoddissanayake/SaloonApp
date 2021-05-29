import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/models/Categories.dart';

Future<List<TrendingStyles>> getTrendingStyles() async {
  List<TrendingStyles> trendingStylesData = List<TrendingStyles>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _styleCollection = _firestore.collection('styles');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _styleCollection.get();

  // Get data from docs and convert map to List
  // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  final allData = querySnapshot.docs.map((doc) => {
    doc.data()
  }).toList();
  allData.forEach((element) {
    TrendingStyles s = TrendingStyles();
    element.forEach((el) {
      Map<String, Object> tmp = el as Map<String, Object>;
      s.name = tmp.remove("name");
      s.price = tmp.remove("price");
      s.image = tmp.remove("image");
    });
    // s.name = "ff";//element["name"];
    // s.price = "5.00";
    // s.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2Fec909c634ee207713925dc785fe3e86a.jpg?alt=media&token=c2631b0c-f650-42ef-8ab7-22e88a242d54";

    trendingStylesData.add(s);
  });

  print(trendingStylesData);
  return trendingStylesData;
}




List<Categories> getCategories() {
  List<Categories> categoriesData = List<Categories>();

  Categories model = Categories();
  model.name = "Pixie cut";
  model.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fresized-image-Promo.jpeg?alt=media&token=840f3c96-f051-43b4-9154-aef201ce9432";

  Categories model2 = Categories();
  model2.name = "Fauxhawk";
  model2.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fpalvin-gettyimages-1176754645.jpg?alt=media&token=1c39d597-c0e2-4c10-8b7c-62be0c76349d";

  Categories model3 = Categories();
  model3.name = "Chignon";
  model3.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fjavi_thebarber_-spiky-haircuts-for-men-faux-hawk-quiff-e1540331011787.jpg?alt=media&token=0772acb0-8f96-463f-befc-115ecfc02a7a";

  Categories model4 = Categories();
  model4.name = "Croydon";
  model4.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Foriginal.jpg?alt=media&token=a5d96335-2766-4931-b332-5402375a32ef";

  categoriesData.add(model);
  categoriesData.add(model2);
  categoriesData.add(model3);
  categoriesData.add(model4);
  return categoriesData;
}






List<TrendingStyles> getAllTrendingStyles() {
  List<TrendingStyles> allTrendingStylesData = List<TrendingStyles>();

  TrendingStyles model = TrendingStyles();
  model.name = "Fade Haircut";
  model.price = "5.00";
  model.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2Fec909c634ee207713925dc785fe3e86a.jpg?alt=media&token=c2631b0c-f650-42ef-8ab7-22e88a242d54";

  TrendingStyles model2 = TrendingStyles();
  model2.name = "Undercut";
  model2.price = "7.50";
  model2.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2Ftp-easy-hairstyles-for-medium-hair-guide-1.jpg?alt=media&token=7d6bbb48-3a2d-4e51-b444-1752ed94d708";

  TrendingStyles model3 = TrendingStyles();
  model3.name = "Buzz cut";
  model3.price = "4.30";
  model3.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2F1-layered-bob-hairstyle.jpg?alt=media&token=90e82799-b4a9-4dc6-b49e-104109a4e298";

  TrendingStyles model4 = TrendingStyles();
  model4.name = "Beehive";
  model4.price = "4.40";
  model4.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2F14-medium-layered-women-haircut.jpg?alt=media&token=11894829-e3fe-4bd5-a04a-3b291eb6a818";

  TrendingStyles model5 = TrendingStyles();
  model5.name = "Fade Haircut";
  model5.price = "5.00";
  model5.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2Fec909c634ee207713925dc785fe3e86a.jpg?alt=media&token=c2631b0c-f650-42ef-8ab7-22e88a242d54";

  TrendingStyles model6 = TrendingStyles();
  model6.name = "Undercut";
  model6.price = "7.50";
  model6.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2Ftp-easy-hairstyles-for-medium-hair-guide-1.jpg?alt=media&token=7d6bbb48-3a2d-4e51-b444-1752ed94d708";

  TrendingStyles model7 = TrendingStyles();
  model7.name = "Buzz cut";
  model7.price = "4.30";
  model7.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2F1-layered-bob-hairstyle.jpg?alt=media&token=90e82799-b4a9-4dc6-b49e-104109a4e298";

  TrendingStyles model8 = TrendingStyles();
  model8.name = "Beehive";
  model8.price = "4.40";
  model8.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fstyles%2F14-medium-layered-women-haircut.jpg?alt=media&token=11894829-e3fe-4bd5-a04a-3b291eb6a818";



  allTrendingStylesData.add(model);
  allTrendingStylesData.add(model2);
  allTrendingStylesData.add(model3);
  allTrendingStylesData.add(model4);
  allTrendingStylesData.add(model5);
  allTrendingStylesData.add(model6);
  allTrendingStylesData.add(model7);
  allTrendingStylesData.add(model8);
  return allTrendingStylesData;
}





List<Categories> getAllCategories() {
  List<Categories> categoriesData = List<Categories>();

  Categories model = Categories();
  model.name = "Pixie cut";
  model.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fresized-image-Promo.jpeg?alt=media&token=840f3c96-f051-43b4-9154-aef201ce9432";

  Categories model2 = Categories();
  model2.name = "Fauxhawk";
  model2.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fpalvin-gettyimages-1176754645.jpg?alt=media&token=1c39d597-c0e2-4c10-8b7c-62be0c76349d";

  Categories model3 = Categories();
  model3.name = "Chignon";
  model3.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fjavi_thebarber_-spiky-haircuts-for-men-faux-hawk-quiff-e1540331011787.jpg?alt=media&token=0772acb0-8f96-463f-befc-115ecfc02a7a";

  Categories model4 = Categories();
  model4.name = "Croydon";
  model4.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Foriginal.jpg?alt=media&token=a5d96335-2766-4931-b332-5402375a32ef";

  Categories model5 = Categories();
  model5.name = "Pixie cut";
  model5.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fresized-image-Promo.jpeg?alt=media&token=840f3c96-f051-43b4-9154-aef201ce9432";

  Categories model6 = Categories();
  model6.name = "Fauxhawk";
  model6.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fpalvin-gettyimages-1176754645.jpg?alt=media&token=1c39d597-c0e2-4c10-8b7c-62be0c76349d";

  Categories model7 = Categories();
  model7.name = "Chignon";
  model7.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Fjavi_thebarber_-spiky-haircuts-for-men-faux-hawk-quiff-e1540331011787.jpg?alt=media&token=0772acb0-8f96-463f-befc-115ecfc02a7a";

  Categories model8 = Categories();
  model8.name = "Croydon";
  model8.image = "https://firebasestorage.googleapis.com/v0/b/flutter-ctse.appspot.com/o/images%2Fcategories%2Foriginal.jpg?alt=media&token=a5d96335-2766-4931-b332-5402375a32ef";

  categoriesData.add(model);
  categoriesData.add(model2);
  categoriesData.add(model3);
  categoriesData.add(model4);
  categoriesData.add(model5);
  categoriesData.add(model6);
  categoriesData.add(model7);
  categoriesData.add(model8);
  return categoriesData;
}