import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../models/hour_data_model.dart';

class HourDataWidget extends StatelessWidget {
  final HourDataModel item;

  const HourDataWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.time.substring(item.time.length - 5),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Image.network('https:${item.iconURL}', scale: 1),
            Text(
              S.of(context).temperature_c(item.temperature),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const Divider(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.water_drop, color: Colors.white),
                const SizedBox(width: 2),
                Text(item.humidity),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(CupertinoIcons.wind, color: Colors.white),
                const SizedBox(width: 6),
                Text(S.of(context).wind_speed(item.windSpeed)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  CupertinoIcons.cloud_rain_fill,
                  color: Colors.white,
                ),
                const SizedBox(width: 6),
                Text('${item.chanceOfRain}%'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
