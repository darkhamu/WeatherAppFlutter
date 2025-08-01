import 'package:flutter/material.dart';
import 'package:weather_app/weather_page.dart';

import '../generated/l10n.dart';
import 'day_data_widget.dart' show DayDataWidget;
import 'glass_card.dart';
import 'hour_data_widget.dart';
import 'weather_now_data_widget.dart';

class MainScreenWidget extends StatelessWidget {
  final String currentAddress;

  const MainScreenWidget({super.key, required this.currentAddress});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherPage()),
                );
              },
              icon: const Icon(Icons.update, size: 28, color: Colors.white),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      GlassCard(child: WeatherNowData()),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                        child: TabBar(
                          tabs: [
                            Tab(text: S.of(context).hourly),
                            Tab(text: S.of(context).for_three_days),
                          ],
                          labelColor: Colors.white,
                          labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
                          unselectedLabelColor: Colors.white.withAlpha(150),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          dividerHeight: 0,
                          padding: const EdgeInsets.all(4),
                          labelPadding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: HourDataWidget(),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: DayDataWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
