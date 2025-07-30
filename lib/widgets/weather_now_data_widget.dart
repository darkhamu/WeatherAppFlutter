import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherNowData extends StatelessWidget {
  const WeatherNowData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '2025-07-28 18:00',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Icon(Icons.cloud, size: 72, color: Colors.white),
        Text(
          'Mist',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300),
        ),
        Text(
          '20.2°C',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
        ),
        Text(
          'Ощущается: 20.2°C',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.water_drop, color: Colors.white),
                Text(
                  '78',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                Icon(CupertinoIcons.wind, color: Colors.white),
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '12.7 km/h',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Направление: СВ',
                      style: TextStyle(
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
