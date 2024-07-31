import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';
import 'package:flutter_application_2/src/feature/home/page/map_page/logic/app_location_logic.dart';
import 'package:flutter_application_2/src/feature/home/page/map_page/model/app_location.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  final List<DoneWork> doneWorkList;
  final List<Field> fieldList;

  const MapPage(
      {super.key, required this.doneWorkList, required this.fieldList});

  @override
  State<MapPage> createState() => _MapPageState();
}

Set<Polygon> polygons = HashSet<Polygon>();
Set<Marker> markers = {};

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();

    List<Field> filterdListField = widget.fieldList.where((field) {
      return widget.doneWorkList
          .any((work) => field.id == work.linked_objects!.field);
    }).toList();

    List<List<LatLng>> fieldPoints = createPolygon(filterdListField);
    initFieldsPolygon(fieldPoints);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackgoundColor,
          title: Text(
            'Home > Maps',
            style: AppStyle.headingH118SemiBold,
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                  markers: markers,
                  mapType: mapLooks,
                  polygons: polygons,
                  onMapCreated: (controller) => _onMapCreated(controller),
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(53.296205173841145, 69.16685579956297),
                      zoom: 10)),
              InkWell(
                onTap: () => setState(() => changePlatfrom(mapLooks)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.appBarBackgoundColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Icon(Icons.change_circle_outlined),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                child: InkWell(
                    onTap: () => toMyPosition(),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.appBarBackgoundColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Icon(Icons.place),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}

//onMapCreated
GoogleMapController? googleMapController;
void _onMapCreated(GoogleMapController controller) {
  googleMapController = controller;
}

//change platform
MapType mapLooks = MapType.hybrid;
void changePlatfrom(MapType mapType) {
  if (mapType == MapType.hybrid) {
    mapLooks = MapType.normal;
  } else {
    mapLooks = MapType.hybrid;
  }
}

//toCurrentLocation
AppLocationRepository appLocation = AppLocationRepository();

Future<void> toMyPosition() async {
  bool permission = await appLocation.checkPermission();
  if (!permission) {
    await appLocation.requestPermission();
  } else if (permission) {
    AppLatLong appLatLong;
    final defaultLocation = DefultLocationAstana();
    try {
      appLatLong = await appLocation.getCurrentLocation();
      moveToCurrentLocation(appLatLong);
    } catch (e) {
      appLatLong = defaultLocation;
      moveToCurrentLocation(appLatLong);
    }
  }
}

Future<void> moveToCurrentLocation(AppLatLong location) async {
  try {
    await googleMapController!.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(location.lat, location.long), zoom: 12)));
    Marker(
        markerId: const MarkerId('me'),
        position: LatLng(location.lat, location.long));
  } catch (e) {
    log('erorr');
  }
}

//Polygon Functions

List<List<LatLng>> createPolygon(dynamic object) {
  List<List<LatLng>> points = [];
  for (int i = 0; i < object.length; i++) {
    List<dynamic> coordinates = object[i].shape_gis!['coordinates'][0][0];
    List<List<double>> doubleClone = convertDynamicToDoubleList(coordinates);
    List<LatLng> latLng = convertToLatLng(doubleClone);
    points.add(latLng);
  }
  return points;
}

List<LatLng> convertToLatLng(List<List<double>> coordinates) {
  try {
    return coordinates.map((coords) {
      return LatLng(coords[1], coords[0]);
    }).toList();
  } catch (e) {
    throw ArgumentError('wrong data Fromate');
  }
}

List<List<double>> convertDynamicToDoubleList(dynamic dynamicList) {
  if (dynamicList is List &&
      dynamicList
          .every((item) => item is List && (item).every((e) => e is num))) {
    return List<List<double>>.from(dynamicList.map((list) {
      return List<double>.from(list.map((item) => item.toDouble()));
    }));
  } else {
    throw ArgumentError('wrong Data formate');
  }
}

void initFieldsPolygon(List<List<LatLng>> points) {
  log(points.first.toString());
  for (int i = 0; i < points.length; i++) {
    polygons.add(Polygon(
        onTap: () {},
        polygonId: PolygonId('id-$i'),
        points: points[i],
        strokeWidth: 0,
        fillColor: Colors.red.withOpacity(0.3)));
  }
}
