class CurrentWeatherModel {
  final String lastUpdate;
  final String iconUrl;
  final String weatherName;
  final String temperature;
  final String feelsLikeTemp;
  final String humidity;
  final String windSpeed;
  final String windDirection;

  CurrentWeatherModel({required this.lastUpdate, required this.iconUrl, required this.weatherName, required this.temperature, required this.feelsLikeTemp, required this.humidity, required this.windSpeed, required this.windDirection});
}