import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/models/Categories.dart';

List<TrendingStyles> getTrendingStyles() {
  List<TrendingStyles> trendingStylesData = List<TrendingStyles>();

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

  trendingStylesData.add(model);
  trendingStylesData.add(model2);
  trendingStylesData.add(model3);
  trendingStylesData.add(model4);
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

