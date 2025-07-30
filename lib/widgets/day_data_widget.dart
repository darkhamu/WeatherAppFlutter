import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayDataWidget extends StatelessWidget {
  const DayDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('2025-07-30',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud, size: 64, color: Colors.white),
            SizedBox(width: 10,),
            Text(
              'Туман',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Text(
          '13.3°C - 17.3°C',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.water_drop, color: Colors.white,),
            SizedBox(width: 10,),
            Text('Средняя влажность - 93', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
          ],
        ),
        SizedBox(height: 6,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.wind, color: Colors.white,),
            SizedBox(width: 10,),
            Text('Макс. - 26.3км/ч', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
          ],
        ),
        SizedBox(height: 10,),
        Divider(),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(CupertinoIcons.sunrise_fill, color: Colors.white, size: 32,),
            Text('05:21 - 21:11', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            Icon(CupertinoIcons.sunset_fill, color: Colors.white, size: 32,)
          ],
        ),
        SizedBox(height: 10,),
        Text('Текущая фаза луны - Растущий полумесяц', style: TextStyle(fontSize: 14),),
      ],
    );
  }
}
