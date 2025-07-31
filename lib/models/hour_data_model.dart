import 'package:flutter/material.dart';

class HourDataModel {
  final String time;
  final String iconURL;
  final String temperature;
  final String humidity;
  final String chanceOfRain;
  final String windSpeed;

  HourDataModel({
    required this.time,
    required this.iconURL,
    required this.temperature,
    required this.humidity,
    required this.chanceOfRain,
    required this.windSpeed,
  });

  void printModel(HourDataModel item) {
    debugPrint(
      'DATA!!!!!!!!!\n\n\n\n\nTime - ${item.time},'
      '\niconURL - ${item.iconURL},\ntemperature - ${item.temperature},'
      '\nhumidity - ${item.humidity}, \nchanceOfRain - ${item.chanceOfRain},'
      '\nwindSpeed - ${item.windSpeed}\n\n\n\n\nEND OF DATA',
    );
  }
}
