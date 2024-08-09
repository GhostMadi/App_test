class AppLatLong {
  final double lat;
  final double long;
  AppLatLong({required this.lat, required this.long});
}

class DefultLocationAstana extends AppLatLong {
  DefultLocationAstana({super.long = 71.44907, super.lat = 51.169392});
}
