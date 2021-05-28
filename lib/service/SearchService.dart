import 'package:saloon_app/models/TrendingStyles.dart';

List<TrendingStyles> getSearchResults() {
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



  trendingStylesData.add(model);
  trendingStylesData.add(model2);
  trendingStylesData.add(model3);
  trendingStylesData.add(model4);
  trendingStylesData.add(model5);
  trendingStylesData.add(model6);
  trendingStylesData.add(model7);
  trendingStylesData.add(model8);

  return trendingStylesData;
}


