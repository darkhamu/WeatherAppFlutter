import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/hour_data_model.dart';
import 'package:weather_app/widgets/glass_card.dart';
import 'package:weather_app/widgets/hour_data_widget.dart';

import 'data_model_inherit_widget.dart';

class HourWeatherWidget extends StatelessWidget {
  const HourWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<HourDataModel> listDayData = context.dependOnInheritedWidgetOfExactType<DataModelInheritWidget>()?.hourDataModel ?? [];
    return ListView.builder(
      itemCount: listDayData.length,
      itemBuilder: (BuildContext context, int index) {
        HourDataModel item = listDayData[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GlassCard(
            child: HourDataWidget(item: item,),
          ),
        );
      },
    );
  }
}
