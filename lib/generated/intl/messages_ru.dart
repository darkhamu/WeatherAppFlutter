// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(humidity) => "Средняя влажность - ${humidity}";

  static String m1(phase) => "Текущая фаза луны - ${phase}";

  static String m2(temp) => "Ощущается: ${temp}°C";

  static String m3(speed) => "Макс. скорость - ${speed}км/ч";

  static String m4(temp) => "${temp}°C";

  static String m5(windDirection) => "Направление: ${windDirection}";

  static String m6(speed) => "${speed} км/ч";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_name": MessageLookupByLibrary.simpleMessage("WeatherApp"),
    "avg_humidity": m0,
    "current_moon_phase": m1,
    "e": MessageLookupByLibrary.simpleMessage("В"),
    "ene": MessageLookupByLibrary.simpleMessage("ВСВ"),
    "ese": MessageLookupByLibrary.simpleMessage("ВЮВ"),
    "feels_like": m2,
    "for_three_days": MessageLookupByLibrary.simpleMessage("На 3 дня"),
    "hourly": MessageLookupByLibrary.simpleMessage("Почасовой"),
    "loading_data": MessageLookupByLibrary.simpleMessage("Загружаем данные..."),
    "max_wind_speed": m3,
    "n": MessageLookupByLibrary.simpleMessage("С"),
    "ne": MessageLookupByLibrary.simpleMessage("СВ"),
    "nne": MessageLookupByLibrary.simpleMessage("ССВ"),
    "nnw": MessageLookupByLibrary.simpleMessage("ССЗ"),
    "nw": MessageLookupByLibrary.simpleMessage("СЗ"),
    "reload": MessageLookupByLibrary.simpleMessage("Перезагрузить"),
    "s": MessageLookupByLibrary.simpleMessage("Ю"),
    "se": MessageLookupByLibrary.simpleMessage("ЮВ"),
    "something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Что-то пошло не так... Проверьте свое подключение к интернету",
    ),
    "sse": MessageLookupByLibrary.simpleMessage("ЮЮВ"),
    "ssw": MessageLookupByLibrary.simpleMessage("ЮЮЗ"),
    "sw": MessageLookupByLibrary.simpleMessage("ЮЗ"),
    "temperature_c": m4,
    "w": MessageLookupByLibrary.simpleMessage("З"),
    "wind_direction": m5,
    "wind_speed": m6,
    "wnw": MessageLookupByLibrary.simpleMessage("ЗСЗ"),
    "wsw": MessageLookupByLibrary.simpleMessage("ЗЮЗ"),
  };
}
