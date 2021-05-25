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
  model.name = "Chillax Heritage";
  model.image = "https://picsum.photos/200/200";

  Categories model2 = Categories();
  model2.name = "Hotel Bangkok Saran";
  model2.image = "https://picsum.photos/200/200";

  Categories model3 = Categories();
  model3.name = "One 10";
  model3.image = "https://picsum.photos/200/200";

  Categories model4 = Categories();
  model4.name = "One 10";
  model4.image = "https://picsum.photos/200/200";

  categoriesData.add(model);
  categoriesData.add(model2);
  categoriesData.add(model3);
  categoriesData.add(model4);
  return categoriesData;
}

