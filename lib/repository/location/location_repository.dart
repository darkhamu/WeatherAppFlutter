import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:location/location.dart';

Future<LocationData?> getLocation(Location location) async {
  try {
    final locationData = await location.getLocation();
    return locationData;
  } catch (e) {
    debugPrint('Error getting location: $e');
  }
  return null;
}

Future<String> getAddressFromLatLng(LocationData location) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      location.latitude!,
      location.longitude!,
    );
    Placemark place = placemarks[0];
    return '${place.locality}, ${place.country}';
  } catch (e) {
    debugPrint(e.toString());
  }
  return '';
}