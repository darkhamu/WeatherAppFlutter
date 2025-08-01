import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/widgets/glass_card.dart';

import '../generated/l10n.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      'assets/json/load_animation.json',
                      repeat: true,
                      fit: BoxFit.contain,
                    ),
                    Text(S.of(context).loading_data, style: const TextStyle(fontSize: 24, color: Colors.white, decoration: TextDecoration.none, fontWeight: FontWeight.w600),),
                    const SizedBox(height: 16,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
