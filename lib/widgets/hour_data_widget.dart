import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/glass_card.dart';

class HourDataWidget extends StatelessWidget {
  const HourDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('00:00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              Icon(Icons.sunny, color: Colors.white, size: 32,),
              Text('13.0°C', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.water_drop, color: Colors.white),
                  const SizedBox(width: 2,),
                  Text('78'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.wind, color: Colors.white),
                  const SizedBox(width: 6,),
                  Text('16.2 км/ч'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white),
                  const SizedBox(width: 6,),
                  Text('78%'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
