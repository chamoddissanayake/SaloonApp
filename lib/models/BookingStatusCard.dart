import 'package:saloon_app/models/Location.dart';
import 'package:saloon_app/models/TrendingStyles.dart';

class BookingStatusCardModel {
  // String booking_id;
  // String style_name;
  // String image;
  // String date;
  // String time;
  String booking_id = "";
  String booking_status  = "";
  String date_time = "";
  String location_id = "";
  String style_id = "";
  String user_email = "";
  String user_id = "";
  String user_type = "";
  TrendingStyles tsObj;
  Location currentLoc;

  // BookingStatusCardModel(this.style_name, this.image, this.date, this.time);
  BookingStatusCardModel(this.booking_id,this.booking_status, this.date_time, this.location_id,
      this.style_id, this.user_email, this.user_id, this.user_type, this.tsObj, this.currentLoc);
}
