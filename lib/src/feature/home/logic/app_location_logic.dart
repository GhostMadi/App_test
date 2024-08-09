import 'package:flutter_application_2/src/feature/home/model/app_location.dart';
import 'package:geolocator/geolocator.dart';

class AppLocationRepository {
  final defaultLocation = DefultLocationAstana();

  Future<AppLatLong> getCurrentLocation() {
    return Geolocator.getCurrentPosition()
        .then((value) => AppLatLong(lat: value.latitude, long: value.longitude))
        .catchError((_) => defaultLocation);
  }

  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }
}
