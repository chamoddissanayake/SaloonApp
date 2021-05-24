import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:saloon_app/models/markerModel.dart';
import '../tools/tools.dart';
import '../utils/MapUtils.dart';

//********* Global Variables */

const LatLng _center = const LatLng(6.934103, 79.867532);
LatLng newPosition;
CameraPosition newCameraPosition =
CameraPosition(target: LatLng(6.934103, 79.867532), zoom: 15);

Set<Marker> markers = {};
int _index = 0;
int indexMarker;
String name;
String description;
String latitude;
String longitude;

ValueNotifier valueNotifier = ValueNotifier(indexMarker);


class MapScreen extends StatefulWidget {
  static const routeName = '/map';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  //******** Map variables */
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  //******* getMarkers */
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  void getMarkers() async {
    final Uint8List userMarkerIcon =
    await getBytesFromAsset('assets/images/map/normalMarker.png', 75);

    final Uint8List selectedMarkerIcon =
    await getBytesFromAsset('assets/images/map/selectedMarker.png', 100);

    markers = {};

    Tools.markersList.forEach((element) {
      if (element.latitude != null && element.longitude != null) {
        if (element.id == indexMarker) {
          markers.add(Marker(
              draggable: false,
              markerId: MarkerId(element.latitude + element.longitude),
              position: LatLng(
                double.tryParse(element.latitude),
                double.tryParse(element.longitude),
              ),
              icon: BitmapDescriptor.fromBytes(selectedMarkerIcon),
              infoWindow: InfoWindow(title: element.name)));
        } else {
          markers.add(Marker(
              draggable: false,
              markerId: MarkerId(element.latitude + element.longitude),
              position: LatLng(
                double.tryParse(element.latitude),
                double.tryParse(element.longitude),
              ),
              icon: BitmapDescriptor.fromBytes(userMarkerIcon),
              infoWindow: InfoWindow(title: element.name)));
        }
      }
    });

    valueNotifier.value = indexMarker;
  }

  //******** OnMapCreated */
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
  }

  @override
  void initState() {
    getData();
    setFirstValue();
    getMarkers();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 0,
        builder: (context, snapshot) {
          return Scaffold(
              body: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifier, // that's the value we are listening to
                        builder: (context, value, child) {
                          return GoogleMap(
                              zoomControlsEnabled: false,
                              markers: markers,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: false,
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: _center,
                                zoom: 11.0,
                              ));
                        }),
                  ),
                  // Here is tha PageView Builder
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 78.0),
                        child: SizedBox(
                          height: 116, // card height
                          child: GestureDetector(
                            onTap: (){
                              print("#####");
                              print(indexMarker);
                              print(name) ;
                              print(description) ;
                              print(latitude) ;
                              print(longitude) ;
                              print("*****");

                              MapUtils.openMap(double.parse(latitude),double.parse(longitude));
                            },
                            child: PageView.builder(
                              itemCount: Tools.markersList.length,
                              controller: PageController(viewportFraction: 0.9),
                              onPageChanged: (int index) {
                                setState(() => _index = index);
                                indexMarker = Tools.markersList[index].id;
                                name = Tools.markersList[index].name;
                                description  = Tools.markersList[index].description;
                                latitude =  Tools.markersList[index].latitude;
                                longitude =  Tools.markersList[index].longitude;

                                if (Tools.markersList[index].latitude != null &&
                                    Tools.markersList[index].longitude != null) {
                                  newPosition = LatLng(
                                      double.tryParse(
                                          Tools.markersList[index].latitude),
                                      double.tryParse(
                                          Tools.markersList[index].longitude));
                                  newCameraPosition =
                                      CameraPosition(target: newPosition, zoom: 15);
                                }
                                getMarkers();
                                mapController
                                    .animateCamera(CameraUpdate.newCameraPosition(
                                    newCameraPosition))
                                    .then((val) {
                                  setState(() {});
                                });
                              },
                              itemBuilder: (_, i) {
                                return Transform.scale(
                                  scale: i == _index ? 1 : 0.9,
                                  child: new Container(
                                    height: 116.00,
                                    width: 325.00,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.5, 0.5),
                                          color:
                                          Color(0xff000000).withOpacity(0.12),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10.00),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 9, top: 7, bottom: 7, right: 9),
                                          child: Container(
                                            height: 86.00,
                                            width: 86.00,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    Tools.markersList[i].image),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.00),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, right: 0.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Wrap(
                                                alignment: WrapAlignment.start,
                                                spacing: 2,
                                                direction: Axis.vertical,
                                                children: <Widget>[
                                                  Text(
                                                    Tools.markersList[i].name,
                                                    style: TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 15,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 230,
                                                    child: Text(
                                                      Tools.markersList[i]
                                                          .description,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 4,
                                                      style: TextStyle(
                                                        fontFamily: "Montserrat",
                                                        fontSize: 10,
                                                        color: Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ))
                ],
              ));
        });
  }

  void getData() {

    Tools.markersList.add(MarkersModel(
        1,
        "Gampaha Branch",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        "7.093183",
        "79.993691",
        "https://drive.google.com/uc?export=view&id=1vgOozPyLhaDDmhR-LJniMmgN9w9xjCmr"));
    Tools.markersList.add(MarkersModel(
        2,
        "Kandy Branch",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        "7.293288",
        "80.634956",
        "https://drive.google.com/uc?export=view&id=1TFVjuy_tdHR31p6Wg1XI7ibD8VCOam56"));
    Tools.markersList.add(MarkersModel(
        3,
        "Colombo Branch",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        "6.933454",
        "79.865896",
        "https://drive.google.com/uc?export=view&id=1E0_8-tl3xFAQg-rvUhuR75DQLn2ZQejc"));
    Tools.markersList.add(MarkersModel(
        4,
        "Galle Branch",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        "6.032733",
        "80.215808",
        "https://drive.google.com/uc?export=view&id=1Tyt3fw1vK7OSA6QXMf2iykcEg2tmQIR0"));
    Tools.markersList.add(MarkersModel(
        5,
        "Matara Branch",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        "5.942960",
        "80.551020",
        "https://drive.google.com/uc?export=view&id=1Vk4RBYY_yB5I85g7MNsUTBmsVMoQ2pzY"));
  }

  void setFirstValue() {
    indexMarker = Tools.markersList[0].id;
    name = Tools.markersList[0].name;
    description = Tools.markersList[0].description;
    latitude = Tools.markersList[0].latitude;
    longitude = Tools.markersList[0].longitude;
  }


}
