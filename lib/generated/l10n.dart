// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `WeatherApp`
  String get app_name {
    return Intl.message('WeatherApp', name: 'app_name', desc: '', args: []);
  }

  /// `Loading data...`
  String get loading_data {
    return Intl.message(
      'Loading data...',
      name: 'loading_data',
      desc: '',
      args: [],
    );
  }

  /// `Feels like: {temp}°C`
  String feels_like(Object temp) {
    return Intl.message(
      'Feels like: $temp°C',
      name: 'feels_like',
      desc: '',
      args: [temp],
    );
  }

  /// `{speed} km/h`
  String wind_speed(Object speed) {
    return Intl.message(
      '$speed km/h',
      name: 'wind_speed',
      desc: '',
      args: [speed],
    );
  }

  /// `Direction: {windDirection}`
  String wind_direction(Object windDirection) {
    return Intl.message(
      'Direction: $windDirection',
      name: 'wind_direction',
      desc: '',
      args: [windDirection],
    );
  }

  /// `{temp}°C`
  String temperature_c(Object temp) {
    return Intl.message(
      '$temp°C',
      name: 'temperature_c',
      desc: '',
      args: [temp],
    );
  }

  /// `The average humidity - {humidity}`
  String avg_humidity(Object humidity) {
    return Intl.message(
      'The average humidity - $humidity',
      name: 'avg_humidity',
      desc: '',
      args: [humidity],
    );
  }

  /// `Max speed - {speed}km/h`
  String max_wind_speed(Object speed) {
    return Intl.message(
      'Max speed - ${speed}km/h',
      name: 'max_wind_speed',
      desc: '',
      args: [speed],
    );
  }

  /// `Current moon phase - {phase}`
  String current_moon_phase(Object phase) {
    return Intl.message(
      'Current moon phase - $phase',
      name: 'current_moon_phase',
      desc: '',
      args: [phase],
    );
  }

  /// `N`
  String get n {
    return Intl.message('N', name: 'n', desc: '', args: []);
  }

  /// `S`
  String get s {
    return Intl.message('S', name: 's', desc: '', args: []);
  }

  /// `E`
  String get e {
    return Intl.message('E', name: 'e', desc: '', args: []);
  }

  /// `W`
  String get w {
    return Intl.message('W', name: 'w', desc: '', args: []);
  }

  /// `NE`
  String get ne {
    return Intl.message('NE', name: 'ne', desc: '', args: []);
  }

  /// `SE`
  String get se {
    return Intl.message('SE', name: 'se', desc: '', args: []);
  }

  /// `SW`
  String get sw {
    return Intl.message('SW', name: 'sw', desc: '', args: []);
  }

  /// `NW`
  String get nw {
    return Intl.message('NW', name: 'nw', desc: '', args: []);
  }

  /// `NNE`
  String get nne {
    return Intl.message('NNE', name: 'nne', desc: '', args: []);
  }

  /// `ENE`
  String get ene {
    return Intl.message('ENE', name: 'ene', desc: '', args: []);
  }

  /// `ESE`
  String get ese {
    return Intl.message('ESE', name: 'ese', desc: '', args: []);
  }

  /// `SSE`
  String get sse {
    return Intl.message('SSE', name: 'sse', desc: '', args: []);
  }

  /// `SSW`
  String get ssw {
    return Intl.message('SSW', name: 'ssw', desc: '', args: []);
  }

  /// `WSW`
  String get wsw {
    return Intl.message('WSW', name: 'wsw', desc: '', args: []);
  }

  /// `WNW`
  String get wnw {
    return Intl.message('WNW', name: 'wnw', desc: '', args: []);
  }

  /// `NNW`
  String get nnw {
    return Intl.message('NNW', name: 'nnw', desc: '', args: []);
  }

  /// `Hourly`
  String get hourly {
    return Intl.message('Hourly', name: 'hourly', desc: '', args: []);
  }

  /// `For 3 days`
  String get for_three_days {
    return Intl.message(
      'For 3 days',
      name: 'for_three_days',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong... Check your internet connection`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong... Check your internet connection',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message('Reload', name: 'reload', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
