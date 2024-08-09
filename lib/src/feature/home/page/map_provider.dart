// ignore_for_file: unused_element

import 'dart:collection';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/feature/home/logic/app_location_logic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class MapProvider extends ChangeNotifier {
  int selected = 0;
  int get _selected => selected;

  AppLocationRepository appLocation = AppLocationRepository();
  //polygons
  Set<Polygon> polygons = HashSet<Polygon>();
  Set<Polygon> get _polygons => polygons;

  //setmarkers
  Set<Marker> myMarkers = {};
  Set<Marker> get _myMarkers => myMarkers;

  //google controller
  GoogleMapController? googleMapController;
  GoogleMapController get _googleMapController => googleMapController!;
  //mapType
  MapType mapType = MapType.normal;
  MapType get _mapType => mapType;

  void changeMap() {
    if (mapType == MapType.normal) {
      mapType = MapType.hybrid;
    } else {
      mapType = MapType.normal;
    }
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    notifyListeners();
  }

  //polygons
  List<List<LatLng>> createPolygon(dynamic object, List<String> names) {
    List<List<LatLng>> points = [];
    for (int i = 0; i < object.length; i++) {
      log(object.toString());
      List<dynamic> coordinates = object[i].shape_gis!['coordinates'][0][0];
      List<List<double>> doubleClone = convertDynamicToDoubleList(coordinates);
      List<LatLng> latLng = convertToLatLng(doubleClone);
      points.add(latLng);
    }
    notifyListeners();
    initFieldsPolygon(points, names);
    return points;
  }

  void initFieldsPolygon(List<List<LatLng>> points, List<String> names) async {
    for (int i = 0; i < points.length; i++) {
      myMarkers.add(Marker(
          infoWindow: InfoWindow(title: ' ${names[i]}'),
          icon: await TextOnImage(text: names[i]).toBitmapDescriptor(
              logicalSize: const Size(150, 150),
              imageSize: const Size(150, 150)),
          position: LatLng(centerOfPolygon(points[i]).latitude,
              centerOfPolygon(points[i]).longitude),
          markerId: MarkerId('field $i')));
      polygons.add(Polygon(
          onTap: () {},
          polygonId: PolygonId('id-$i'),
          points: points[i],
          strokeWidth: 1,
          strokeColor: Colors.green,
          fillColor: Colors.green.withOpacity(0.5)));
    }
    notifyListeners();
  }

  LatLng centerOfPolygon(List<LatLng> llpoints) {
    double lat = 0;
    double long = 0;
    int count = llpoints.length;
    for (LatLng point in llpoints) {
      lat += point.latitude;
      long += point.longitude;
    }
    return LatLng(lat / count, long / count);
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
}

class TextOnImage extends StatefulWidget {
  const TextOnImage({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<TextOnImage> createState() => _TextOnImageState();
}

class _TextOnImageState extends State<TextOnImage> {
  @override
  void initState() {
    super.initState();
    log(widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          widget.text,
          maxLines: 1,
          style: const TextStyle(color: Colors.white, fontSize: 34),
        )
      ],
    );
  }
}
