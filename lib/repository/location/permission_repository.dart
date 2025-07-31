import 'package:location/location.dart';

Future<void> checkPermissions(Location location) async {
  var permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      throw Exception('Location permissions denied');
    }
  }
}