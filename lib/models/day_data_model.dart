import 'package:flutter/material.dart';

class DayDataModel {
  final String data;
  final String minTemp;
  final String maxTemp;
  final String imageUrl;
  final String weatherName;
  final String avgHumidity;
  final String maxWindSpeed;
  final String sunriseTime;
  final String sunsetTime;
  final String moonPhase;

  DayDataModel({
    required this.data,
    required this.minTemp,
    required this.maxTemp,
    required this.imageUrl,
    required this.weatherName,
    required this.avgHumidity,
    required this.maxWindSpeed,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.moonPhase,
  });

  void printModelData(DayDataModel item) {
    debugPrint(
      'DATA!!!!!!!!!\n\n\n\n\nData - ${item.data},'
      '\nminTemp - ${item.minTemp},\nmaxTemp - ${item.maxTemp},'
      '\nimageUrl - ${item.imageUrl}, \nweatherName - ${item.weatherName},'
      '\navgHumidity - ${item.avgHumidity},\nmaxWindSpeed - ${item.maxWindSpeed}, \nsunriseTime - ${item.sunriseTime}'
      '\nsunsetTime - ${item.sunsetTime},\nmoonPhase - ${item.moonPhase}\n\n\n\n\nEND OF DATA',
    );
  }
}
