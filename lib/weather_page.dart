import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/day_data_model.dart';
import 'package:weather_app/models/hour_data_model.dart';
import 'package:weather_app/widgets/data_model_inherit_widget.dart';
import 'package:weather_app/widgets/main_screen_widget.dart';

import 'repository/location/location_repository.dart';
import 'repository/location/permission_repository.dart';
import 'repository/weather_data/weather_data_repository.dart';
import 'widgets/loading_screen.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final loc.Location _location = loc.Location();
  CurrentWeatherModel? currentWeatherData;
  List<DayDataModel> dayData = [];
  List<HourDataModel> hourData = [];

  Future<String> _initLocation() async {
    await checkPermissions(_location);
    final location = await getLocation(_location);

    final result = await WeatherDataRepository().getWeatherData(
      location!.latitude.toString(),
      location.longitude.toString(),
    );
    currentWeatherData = result.$1;
    dayData = result.$2;
    hourData = result.$3;

    return await getAddressFromLatLng(location);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else {
          return DataModelInheritWidget(
            currentWeatherModel: currentWeatherData!,
            dayDataModel: dayData,
            hourDataModel: hourData,
            child: MainScreenWidget(currentAddress: snapshot.data ?? '???',));
        }
      },
    );
  }
}
