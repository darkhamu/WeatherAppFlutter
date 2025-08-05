import 'package:dio/dio.dart';
import 'package:weather_app/app_data/app_data.dart';
import 'package:weather_app/models/current_weather_model.dart';

import '../../models/day_data_model.dart';
import '../../models/hour_data_model.dart';

class WeatherDataRepository {
  Future<(CurrentWeatherModel currentWeather, List<DayDataModel> daysWeatherData, List<HourDataModel> hourDataList)> getWeatherData(String lat, String lon) async {
    final response = await Dio().get(
      'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon&days=3&aqi=no&alerts=no',
    );
    final data = response.data as Map<String, dynamic>;
    final Map<String, dynamic> current = data['current'];
    final CurrentWeatherModel currentWeatherModel = CurrentWeatherModel(
      lastUpdate: current['last_updated'] ?? '',
      iconUrl: current['condition']?['icon'] ?? '',
      weatherName: current['condition']?['text'] ?? '',
      temperature: current['temp_c'].toString() ?? '',
      feelsLikeTemp: current['feelslike_c'].toString() ?? '',
      humidity: current['humidity'].toString() ?? '',
      windSpeed: current['wind_kph'].toString() ?? '',
      windDirection: current['wind_dir'] ?? '',
    );

    final daysWeatherDataList =
        (data['forecast']?['forecastday'] as List?)
            ?.cast<Map<String, dynamic>>() ??
        [];
    List<DayDataModel> daysWeatherData = [];
    for (var day in daysWeatherDataList) {
      daysWeatherData.add(
        DayDataModel(
          data: day['date'] ?? '',
          minTemp: day['day']['mintemp_c'].toString() ?? '',
          maxTemp: day['day']['maxtemp_c'].toString() ?? '',
          imageUrl: day['day']['condition']['icon'].toString() ?? '',
          weatherName: day['day']['condition']['text'].toString() ?? '',
          avgHumidity: day['day']['avghumidity'].toString() ?? '',
          maxWindSpeed: day['day']['maxwind_kph'].toString() ?? '',
          sunriseTime: day['astro']['sunrise'].toString() ?? '',
          sunsetTime: day['astro']['sunset'].toString() ?? '',
          moonPhase: day['astro']['moon_phase'].toString() ?? '',
        ),
      );
    }

    final hoursWeatherDataList =
    (daysWeatherDataList[0]['hour']
            as List?)?.cast<Map<String, dynamic>>() ?? [];
    List<HourDataModel> hourDataList = [];
    for (var item in hoursWeatherDataList) {
      hourDataList.add(
        HourDataModel(
          time: item['time'] ?? '',
          iconURL: item['condition']['icon'] ?? '',
          temperature: item['temp_c'].toString() ?? '',
          humidity: item['humidity'].toString() ?? '',
          chanceOfRain: item['chance_of_rain'].toString() ?? '',
          windSpeed: item['wind_kph'].toString() ?? '',
        ),
      );
    }

    return (currentWeatherModel, daysWeatherData, hourDataList);
  }
}
