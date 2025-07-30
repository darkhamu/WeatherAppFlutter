import 'package:dio/dio.dart';

class WeatherDataRepository {
  Future<void> getWeatherData(String lat, String lon) async {
    final request = await Dio().get('https://api.weatherapi.com/v1/forecast.json?key=8a46cebfb65646e3b8a85255253007&q=$lat,$lon&days=3&aqi=no&alerts=no');
}
}