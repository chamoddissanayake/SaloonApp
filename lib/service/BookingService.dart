import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saloon_app/models/Booking.dart';
import 'package:saloon_app/models/BookingStatusCard.dart';
import 'package:saloon_app/models/CustomUser.dart';
import 'package:saloon_app/models/GoogleUser.dart';
import 'package:saloon_app/models/Location.dart';
import 'package:saloon_app/models/TrendingStyles.dart';
import 'package:saloon_app/utils/UtilFunctions.dart';

import 'LocationService.dart';
import 'StylesCategoriesService.dart';



Future<List<BookingStatusCardModel>> getCompletedBookings() async{


  bool isGoogle = await UtilFunctions.isCurrentUserGoogle();

  GoogleUser gu;
  CustomUser cu;
  String userType = "";
  if(isGoogle == true){
    gu = await UtilFunctions.getSharedStorageGoogleUser();
    userType = "G";
  }else{
    cu = await UtilFunctions.getSharedStorageCustomUser();
    userType = "C";
  }


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _bookingCollection = _firestore.collection('bookings');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _bookingCollection.get();

  List<Booking> allData;

  allData = querySnapshot.docs.map((doc)  {


    // loc.loc_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;

    String booking_status = tmp.remove("booking_status");
    if(booking_status == "1"){
      if(userType=="C"){
        String booking_user_id = tmp.remove("user_id");
        if(booking_user_id == cu.objId){
          Booking bookingObj = Booking();
          bookingObj.booking_id=doc.id;
          bookingObj.date_time = tmp.remove("date_time");
          bookingObj.location = tmp.remove("location_id");
          bookingObj.status = int.parse(booking_status);
          bookingObj.style_id = tmp.remove("style_id");
          bookingObj.user_type = tmp.remove("user_type"); //C  or G
          bookingObj.user_id = booking_user_id;  // if U user
          return bookingObj;
        }
      }else if(userType == "G"){
        String booking_user_email = tmp.remove("user_email");
        if(booking_user_email == gu.email){
          Booking bookingObj = Booking();
          bookingObj.booking_id=doc.id;
          bookingObj.date_time = tmp.remove("date_time");
          bookingObj.location = tmp.remove("location_id");
          bookingObj.status = int.parse(booking_status);
          bookingObj.style_id = tmp.remove("style_id");
          bookingObj.user_type = tmp.remove("user_type"); //C  or G
          bookingObj.user_email = booking_user_email; //C  or G
          return bookingObj;
        }
      }
    }
  }).toList();

  print(allData);

  allData.removeWhere((value) => value == null);
  print(allData);


  List<BookingStatusCardModel> allBookingCompletedCardList =[];

  for(var i = 0; i < allData.length; i++){
    Booking currentItem = allData[i];

    TrendingStyles  ts = await getTrendingStylesById(currentItem.style_id);
    print(ts);

    Location  loc = await getLocationById(currentItem.location);
    print(loc);

    BookingStatusCardModel model1 =
    BookingStatusCardModel(
        currentItem.booking_id,
        allData[i].status.toString(),
        currentItem.date_time,
        currentItem.location,
        currentItem.style_id,
        currentItem.user_email,
        currentItem.user_id,
        currentItem.user_type,
        ts,
        loc
    );

    allBookingCompletedCardList.add(model1);
  }

  print("***************");
  print(allBookingCompletedCardList);
  print("***************");

  return allBookingCompletedCardList;



}





Future<List<BookingStatusCardModel>> getUpcomingBookings() async {


  bool isGoogle = await UtilFunctions.isCurrentUserGoogle();

  GoogleUser gu;
  CustomUser cu;
  String userType = "";
  if(isGoogle == true){
    gu = await UtilFunctions.getSharedStorageGoogleUser();
    userType = "G";
  }else{
    cu = await UtilFunctions.getSharedStorageCustomUser();
    userType = "C";
  }


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _bookingCollection = _firestore.collection('bookings');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _bookingCollection.get();

  List<Booking> allData;

  allData = querySnapshot.docs.map((doc)  {


    // loc.loc_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;

    String booking_status = tmp.remove("booking_status");
    if(booking_status == "0"){
      if(userType=="C"){
        String booking_user_id = tmp.remove("user_id");
        if(booking_user_id == cu.objId){
          Booking bookingObj = Booking();
          bookingObj.booking_id=doc.id;
          bookingObj.date_time = tmp.remove("date_time");
          bookingObj.location = tmp.remove("location_id");
          bookingObj.status = int.parse(booking_status);
          bookingObj.style_id = tmp.remove("style_id");
          bookingObj.user_type = tmp.remove("user_type"); //C  or G
          bookingObj.user_id = booking_user_id;  // if U user
          return bookingObj;
        }
      }else if(userType == "G"){
        String booking_user_email = tmp.remove("user_email");
        if(booking_user_email == gu.email){
          Booking bookingObj = Booking();
          bookingObj.booking_id=doc.id;
          bookingObj.date_time = tmp.remove("date_time");
          bookingObj.location = tmp.remove("location_id");
          bookingObj.status = int.parse(booking_status);
          bookingObj.style_id = tmp.remove("style_id");
          bookingObj.user_type = tmp.remove("user_type"); //C  or G
          bookingObj.user_email = booking_user_email; //C  or G
          return bookingObj;
        }
      }
    }
  }).toList();

  print(allData);

  allData.removeWhere((value) => value == null);
  print(allData);


  List<BookingStatusCardModel> allBookingUpcomingCardList =[];

  for(var i = 0; i < allData.length; i++){
    Booking currentItem = allData[i];

    TrendingStyles  ts = await getTrendingStylesById(currentItem.style_id);
    print(ts);

    Location  loc = await getLocationById(currentItem.location);
    print(loc);

    BookingStatusCardModel model1 =
    BookingStatusCardModel(
        currentItem.booking_id,
        allData[i].status.toString(),
        currentItem.date_time,
        currentItem.location,
        currentItem.style_id,
        currentItem.user_email,
        currentItem.user_id,
        currentItem.user_type,
        ts,
        loc
    );

    allBookingUpcomingCardList.add(model1);
  }

  print("***************");
  print(allBookingUpcomingCardList);
  print("***************");

  return allBookingUpcomingCardList;



}





Future<List<BookingStatusCardModel>> getCanceledBookings() async{

  bool isGoogle = await UtilFunctions.isCurrentUserGoogle();

  GoogleUser gu;
  CustomUser cu;
  String userType = "";
  if(isGoogle == true){
    gu = await UtilFunctions.getSharedStorageGoogleUser();
    userType = "G";
  }else{
    cu = await UtilFunctions.getSharedStorageCustomUser();
    userType = "C";
  }


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _bookingCollection = _firestore.collection('bookings');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _bookingCollection.get();

  List<Booking> allData;

  allData = querySnapshot.docs.map((doc)  {


    // loc.loc_id=doc.id;
    Map<String, Object> tmp = doc.data() as Map<String, Object>;

    String booking_status = tmp.remove("booking_status");
    if(booking_status == "2"){
      if(userType=="C"){
        String booking_user_id = tmp.remove("user_id");
        if(booking_user_id == cu.objId){
          Booking bookingObj = Booking();
          bookingObj.booking_id=doc.id;
          bookingObj.date_time = tmp.remove("date_time");
          bookingObj.location = tmp.remove("location_id");
          bookingObj.status = int.parse(booking_status);
          bookingObj.style_id = tmp.remove("style_id");
          bookingObj.user_type = tmp.remove("user_type"); //C  or G
          bookingObj.user_id = booking_user_id;  // if U user
          return bookingObj;
        }
      }else if(userType == "G"){
        String booking_user_email = tmp.remove("user_email");
        if(booking_user_email == gu.email){
          Booking bookingObj = Booking();
          bookingObj.booking_id=doc.id;
          bookingObj.date_time = tmp.remove("date_time");
          bookingObj.location = tmp.remove("location_id");
          bookingObj.status = int.parse(booking_status);
          bookingObj.style_id = tmp.remove("style_id");
          bookingObj.user_type = tmp.remove("user_type"); //C  or G
          bookingObj.user_email = booking_user_email; //C  or G
          return bookingObj;
        }
      }
    }
  }).toList();

  print(allData);

  allData.removeWhere((value) => value == null);
  print(allData); // prints [2]


  List<BookingStatusCardModel> allBookingCanceledCardList =[];

  for(var i = 0; i < allData.length; i++){
    Booking currentItem = allData[i];

    TrendingStyles  ts = await getTrendingStylesById(currentItem.style_id);
    print(ts);

    Location  loc = await getLocationById(currentItem.location);
    print(loc);

    BookingStatusCardModel model1 =
    BookingStatusCardModel(
        currentItem.booking_id,
        allData[i].status.toString(),
        currentItem.date_time,
        currentItem.location,
        currentItem.style_id,
        currentItem.user_email,
        currentItem.user_id,
        currentItem.user_type,
        ts,
        loc
    );

    allBookingCanceledCardList.add(model1);
  }

  print("***************");
  print(allBookingCanceledCardList);
  print("***************");

  return allBookingCanceledCardList;
}

Future<TrendingStyles> getTrendingStylesById(String style_id) async{
     TrendingStyles ts =  await getTrendingStyleById(style_id);
     return ts;
}


Future<String> addNewBooking(Booking newBooking) async {

  CollectionReference nb = FirebaseFirestore.instance.collection('bookings');
  return nb.add({
    "date_time":newBooking.date_time,
    "location_id": newBooking.location,
    "booking_status": "0",
    "style_id":newBooking.style_id,
    "user_email":newBooking.user_email,
    "user_id":newBooking.user_id,
    "user_type":newBooking.user_type
  })
      .then((value) {
    print("Booking added");
    return value.id;
  } )
      .catchError((error) {
    print("Failed to add the booking: $error");
    return "";
  }
  );


}





Future<bool> upcomingToCancelFunc(BookingStatusCardModel obj) async {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _bookingCollection = _firestore.collection('bookings');

  _bookingCollection.doc(obj.booking_id).update({

    "booking_status": "2",
    "date_time": obj.date_time,
    "location_id": obj.location_id,
    "style_id": obj.style_id,
    "user_email": obj.user_email,
    "user_id": obj.user_id,
    "user_type": obj.user_type

  }).then((_) {
    print("update for booking cancel success!");
    return true;
  });

}