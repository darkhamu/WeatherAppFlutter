import 'package:flutter/material.dart';

import 'day_data_widget.dart' show DayDataWidget;
import 'glass_card.dart';
import 'hour_data_widget.dart';
import 'weather_now_data_widget.dart';

class MainScreenWidget extends StatelessWidget {
  final String currentAddress;

  const MainScreenWidget({super.key, required this.currentAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF929292),
        title: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 28,
              color: Colors.white,
            ),
            Text(
              currentAddress,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.update, size: 28, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 12),
                  // SearchPoly(searchController: searchController),
                  const SizedBox(height: 16),
                  const GlassCard(child: WeatherNowData()),
                  const SizedBox(height: 16),
                  const GlassCard(child: DayDataWidget()),
                  const SizedBox(height: 16),
                  const GlassCard(child: HourDataWidget()),
                  const SizedBox(height: 49),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
