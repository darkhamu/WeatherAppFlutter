import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:weather_app/widgets/day_data_widget.dart';
import 'package:weather_app/widgets/hour_data_widget.dart';

import 'widgets/glass_card.dart';
import 'widgets/weather_now_data_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  loc.LocationData? _currentLocation;
  final loc.Location _location = loc.Location();
  String? _currentAddress;
  // TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    await _checkPermissions();
    await _getLocation();
  }

  Future<void> _checkPermissions() async {
    var permissionGranted = await _location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        throw Exception('Location permissions denied');
      }
    }
  }

  Future<void> _getLocation() async {
    try {
      final locationData = await _location.getLocation();
      setState(() {
        _currentLocation = locationData;
        _getAddressFromLatLng();
      });
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentLocation!.latitude!,
        _currentLocation!.longitude!,
      );
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = '${place.locality}, ${place.country}';
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF929292),
        title: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 28,
              color: Colors.white,
            ),
            _currentAddress != null
                ? Text(
              _currentAddress!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
                : const CircularProgressIndicator(color: Colors.white),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.update, size: 28, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.pexels.com/photos/1529881/pexels-photo-1529881.jpeg?cs=srgb&dl=pexels-d-ng-nhan-324384-1529881.jpg&fm=jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 12),
                  // SearchPoly(searchController: searchController),
                  const SizedBox(height: 16),
                  const GlassCard(child: WeatherNowData()),
                  const SizedBox(height: 16),
                  const GlassCard(child: DayDataWidget()),
                  const SizedBox(height: 16,),
                  const GlassCard(child: HourDataWidget()),
                  const SizedBox(height: 49,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
