import 'dart:async';
import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/feature/home/logic/app_location_logic.dart';
import 'package:flutter_application_2/src/feature/home/model/app_location.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  final List<DoneWork> doneWorkList;
  const MapPage({super.key, required this.doneWorkList});

  @override
  State<MapPage> createState() => _MapPageState();
}

final Completer<GoogleMapController> mapController = Completer();

MapType mapLooks = MapType.hybrid;
AppLocationRepository appLocation = AppLocationRepository();

AppLatLong? currentLocation;
Set<Marker> markers = {};

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(123.toString()),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: AppColors.appBarBackgoundColor,
    //       title: Text(
    //         'Home > Maps',
    //         style: AppStyle.headingH118SemiBold,
    //       ),
    //     ),
    //     body: SafeArea(
    //       child: Stack(
    //         children: [
    //           GoogleMap(
    //               polygons: polygon,
    //               markers: markers,
    //               mapType: mapLooks,
    //               onMapCreated: (controller) {
    //                 mapController.complete(controller);
    //               },
    //               initialCameraPosition: const CameraPosition(
    //                   target: LatLng(69.16685579956297, 53.296205173841145),
    //                   zoom: 14)),
    //           InkWell(
    //             onTap: () => setState(() {
    //               if (mapLooks == MapType.hybrid) {
    //                 mapLooks = MapType.normal;
    //               } else {
    //                 mapLooks = MapType.hybrid;
    //               }
    //             }),
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                     color: AppColors.appBarBackgoundColor,
    //                     borderRadius: BorderRadius.circular(4)),
    //                 child: const Icon(Icons.change_circle_outlined),
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             right: 10,
    //             child: InkWell(
    //                 onTap: () => setState(() {
    //                       isCheck();
    //                     }),
    //                 child: SizedBox(
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Container(
    //                       decoration: BoxDecoration(
    //                           color: AppColors.appBarBackgoundColor,
    //                           borderRadius: BorderRadius.circular(4)),
    //                       child: const Icon(Icons.place),
    //                     ),
    //                   ),
    //                 )),
    //           )
    //         ],
    //       ),
    //     ));
  }
}

Set<Polygon> polygon = HashSet<Polygon>();

List<LatLng> points = const [
  LatLng(69.16685579956297, 53.296205173841145),
  LatLng(69.18998665797193, 53.29803949448112),
  LatLng(69.18976208653132, 53.27969274284479),
  LatLng(69.16655637097514, 53.277230993887),
  LatLng(69.16685579956297, 53.296205173841145),
];

Future<void> isCheck() async {
  bool isPermission = await appLocation.checkPermission();
  if (isPermission == false) {
    await appLocation.requestPermission();
  }
  fetchCurrnetLocation();
}

Future<void> fetchCurrnetLocation() async {
  AppLatLong location;
  final defaultLocation = DefultLocationAstana();
  try {
    location = await appLocation.getCurrentLocation();
  } catch (e) {
    location = defaultLocation;
  }
  moveToCurrentLocation(location);
}

Future<void> moveToCurrentLocation(AppLatLong location) async {
  markers.add(Marker(
      markerId: const MarkerId('me'),
      position: LatLng(location.lat, location.long)));
  (await mapController.future).moveCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(location.lat, location.long), zoom: 12)));
}
