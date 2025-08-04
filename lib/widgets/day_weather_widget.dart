import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/day_data_model.dart';
import 'package:weather_app/widgets/data_model_inherit_widget.dart';
import 'package:weather_app/widgets/day_data_widget.dart';
import 'package:weather_app/widgets/glass_card.dart';

class DayWeatherWidget extends StatelessWidget {
  const DayWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<DayDataModel> listDayData = context.dependOnInheritedWidgetOfExactType<DataModelInheritWidget>()?.dayDataModel ?? [];
    return ListView.builder(
      itemCount: listDayData.length,
      itemBuilder: (BuildContext context, int index) {
        DayDataModel item = listDayData[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GlassCard(
            child: DayDataWidget(item: item,),
          ),
        );
      },
    );
  }
}
