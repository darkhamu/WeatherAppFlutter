// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(humidity) => "The average humidity - ${humidity}";

  static String m1(phase) => "Current moon phase - ${phase}";

  static String m2(temp) => "Feels like: ${temp}°C";

  static String m3(speed) => "Max speed - ${speed}km/h";

  static String m4(temp) => "${temp}°C";

  static String m5(windDirection) => "Direction: ${windDirection}";

  static String m6(speed) => "${speed} km/h";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_name": MessageLookupByLibrary.simpleMessage("WeatherApp"),
    "avg_humidity": m0,
    "current_moon_phase": m1,
    "e": MessageLookupByLibrary.simpleMessage("E"),
    "feels_like": m2,
    "loading_data": MessageLookupByLibrary.simpleMessage("Loading data..."),
    "max_wind_speed": m3,
    "n": MessageLookupByLibrary.simpleMessage("N"),
    "ne": MessageLookupByLibrary.simpleMessage("NE"),
    "nw": MessageLookupByLibrary.simpleMessage("NW"),
    "s": MessageLookupByLibrary.simpleMessage("S"),
    "se": MessageLookupByLibrary.simpleMessage("SE"),
    "sw": MessageLookupByLibrary.simpleMessage("SW"),
    "temperature_c": m4,
    "w": MessageLookupByLibrary.simpleMessage("W"),
    "wind_direction": m5,
    "wind_speed": m6,
  };
}
