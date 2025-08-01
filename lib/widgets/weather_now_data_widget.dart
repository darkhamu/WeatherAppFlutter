import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/widgets/data_model_inherit_widget.dart';

import '../generated/l10n.dart';
import '../repository/text_translate/translation_service.dart';

class WeatherNowData extends StatefulWidget {
  const WeatherNowData({super.key});

  @override
  State<WeatherNowData> createState() => _WeatherNowDataState();
}

class _WeatherNowDataState extends State<WeatherNowData> {
  String weatherName = '';

  Future<void> getWeatherName(String currentText) async {
    final translated = await TranslationService.translate(currentText);
    setState(() {
      weatherName = translated;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final data = context
          .dependOnInheritedWidgetOfExactType<DataModelInheritWidget>()
          ?.currentWeatherModel;
      if (data != null) {
        getWeatherName(data.weatherName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CurrentWeatherModel data =
        context
            .dependOnInheritedWidgetOfExactType<DataModelInheritWidget>()
            ?.currentWeatherModel ??
            CurrentWeatherModel(
              lastUpdate: '',
              iconUrl:
              '//www.freeiconspng.com/thumbs/load-icon-png/load-icon-png-8.png',
              weatherName: '',
              temperature: '',
              feelsLikeTemp: '',
              humidity: '',
              windSpeed: '',
              windDirection: '',
            );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          data.lastUpdate,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Image.network('https:${data.iconUrl}', scale: 0.5),
        Text(
          weatherName,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w300),
        ),
        Text(
          S.of(context).temperature_c(data.temperature),
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        Text(
          S.of(context).feels_like(data.feelsLikeTemp),
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.water_drop, color: Colors.white),
                Text(
                  data.humidity,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(CupertinoIcons.wind, color: Colors.white),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).wind_speed(data.windSpeed),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      S.of(context).wind_direction(TranslationService().getWindDirectionTranslation(data.windDirection, context)),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
