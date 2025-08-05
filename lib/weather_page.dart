import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/day_data_model.dart';
import 'package:weather_app/models/hour_data_model.dart';
import 'package:weather_app/widgets/data_model_inherit_widget.dart';
import 'package:weather_app/widgets/main_screen_widget.dart';

import 'repository/location/location_repository.dart';
import 'repository/location/permission_repository.dart';
import 'repository/weather_data/weather_data_repository.dart';
import 'widgets/error_screen.dart';
import 'widgets/loading_screen.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  CurrentWeatherModel currentWeatherData = CurrentWeatherModel(
    lastUpdate: 'lastUpdate',
    iconUrl: 'iconUrl',
    weatherName: 'weatherName',
    temperature: 'temperature',
    feelsLikeTemp: 'feelsLikeTemp',
    humidity: 'humidity',
    windSpeed: 'windSpeed',
    windDirection: 'windDirection',
  );
  List<DayDataModel> dayData = [];
  List<HourDataModel> hourData = [];

  Future<String> _initLocation() async {
    await checkPermissions();
    final position = await getCurrentPosition();

    final result = await WeatherDataRepository().getWeatherData(
      position.latitude.toString(),
      position.longitude.toString(),
    );
    currentWeatherData = result.$1;
    dayData = result.$2;
    hourData = result.$3;

    return await getAddressFromLatLng(position);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return ErrorScreen(errorMessage: snapshot.error.toString());
        } else {
          return DataModelInheritWidget(
            currentWeatherModel: currentWeatherData,
            dayDataModel: dayData,
            hourDataModel: hourData,
            child: MainScreenWidget(currentAddress: snapshot.data ?? '???'),
          );
        }
      },
    );
  }
}
