import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/day_data_model.dart';
import 'package:weather_app/models/hour_data_model.dart';

class DataModelInheritWidget extends InheritedWidget {
  final CurrentWeatherModel currentWeatherModel;
  final List<DayDataModel> dayDataModel;
  final List<HourDataModel> hourDataModel;
  const DataModelInheritWidget({super.key, required super.child, required this.currentWeatherModel, required this.dayDataModel, required this.hourDataModel});

  @override
  bool updateShouldNotify(DataModelInheritWidget old) {
    return currentWeatherModel != old.currentWeatherModel;
  }
}
