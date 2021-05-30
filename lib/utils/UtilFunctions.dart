import 'package:saloon_app/utils/globals.dart';


class UtilFunctions {

  static String getReadableSortByValue() {
      if (gblSelectedType == "best_match"){
        return "Best Match";
      }else if (gblSelectedType == "name"){
        return "Name";
      }else if (gblSelectedType == "price_ascending"){
        return "Price Asc.";
      }else if (gblSelectedType == "price_descending"){
        return "Price Desc.";
      }else{
        return "Best Match";
      }
  }
}

