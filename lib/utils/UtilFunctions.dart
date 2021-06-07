import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/models/GoogleUser.dart';
import 'package:saloon_app/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';


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


  static Future<GoogleUser> getSharedStorageGoogleUser()async{
    Future<SharedPreferences> _prefUser = SharedPreferences.getInstance();
    final SharedPreferences prefUser = await _prefUser;

    GoogleUser gu = new GoogleUser();
    gu.uid = prefUser.getString('g_uid');
    gu.email = prefUser.getString('g_email');
    gu.displayName = prefUser.getString('g_displayName');
    gu.photoURL = prefUser.getString('g_photoURL');

    return gu;

  }

  static Future<CustomUser> getSharedStorageCustomUser()async{
    Future<SharedPreferences> _prefUser = SharedPreferences.getInstance();
    final SharedPreferences prefUser = await _prefUser;

    CustomUser cu = new CustomUser();
    cu.objId = prefUser.getString('c_obj_id');
    cu.email = prefUser.getString('c_email');
    cu.password = prefUser.getString('c_password');
    cu.first_name = prefUser.getString('c_first_name');
    cu.last_name = prefUser.getString('c_last_name');
    cu.gender = prefUser.getInt('c_gender');
    cu.photo = prefUser.getString('c_photo');
    cu.phone = prefUser.getString('c_phone');

    return cu;


  }

  static Future<bool> isCurrentUserGoogle()async{
    Future<SharedPreferences> _prefUser = SharedPreferences.getInstance();
    final SharedPreferences prefUser = await _prefUser;

    if(prefUser.getBool('is_google_logged_in') == true){
      return true;
    }else if (prefUser.getBool('is_google_logged_in') ==  false || prefUser.getBool('is_google_logged_in') ==  null){
      return false;
    }

  }

}
