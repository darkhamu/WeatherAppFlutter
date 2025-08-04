import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/day_data_model.dart';

import '../generated/l10n.dart';
import '../repository/text_translate/translation_service.dart';

class DayDataWidget extends StatefulWidget {
  final DayDataModel item;

  const DayDataWidget({super.key, required this.item});

  @override
  State<DayDataWidget> createState() => _DayDataWidgetState();
}

class _DayDataWidgetState extends State<DayDataWidget> {
  String weatherName = '';
  String moonPhaseName = '';

  Future<void> getWeatherName(String weather, String moonPhase) async {
    final translated = await TranslationService.translate(weather);
    final translatedMoonPhase = await TranslationService.translate(moonPhase);
    setState(() {
      weatherName = translated;
      moonPhaseName = translatedMoonPhase;
    });
  }

  @override
  void initState() {
    super.initState();
    getWeatherName(widget.item.weatherName, widget.item.moonPhase);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.item.data,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https:${widget.item.imageUrl}', scale: 1),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                weatherName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Text(
          '${S.of(context).temperature_c(widget.item.minTemp)} - ${S.of(context).temperature_c(widget.item.maxTemp)}',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.water_drop, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              S.of(context).avg_humidity(widget.item.avgHumidity),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.wind, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              S.of(context).max_wind_speed(widget.item.maxWindSpeed),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              CupertinoIcons.sunrise_fill,
              color: Colors.white,
              size: 32,
            ),
            Text(
              '${widget.item.sunriseTime} - ${widget.item.sunsetTime}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Icon(
              CupertinoIcons.sunset_fill,
              color: Colors.white,
              size: 32,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          S.of(context).current_moon_phase(moonPhaseName),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
