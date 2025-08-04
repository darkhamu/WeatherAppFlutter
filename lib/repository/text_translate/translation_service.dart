import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../generated/l10n.dart';

class TranslationService {
  static Future<String> translate(String text) async {
    try {
      final systemLanguage = await _getSystemLanguage();

      if (systemLanguage == 'en' || text.isEmpty) return text;

      final translatedText = await _fetchMyMemoryTranslation(text, systemLanguage);
      return translatedText;
    } catch (e) {
      debugPrint('Translation error: $e');
      return text;
    }
  }

  static Future<String> _getSystemLanguage() async {
    final locale = Platform.localeName;
    return locale.split('_')[0].toLowerCase(); // 'en', 'ru', 'es' и т.д.
  }

  static Future<String> _fetchMyMemoryTranslation(String text, String targetLang) async {
    final encodedText = Uri.encodeComponent(text);
    final uri = Uri.parse(
        'https://api.mymemory.translated.net/get?q=$encodedText&langpair=en|$targetLang'
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['responseData']['translatedText'];
    } else {
      throw Exception('MyMemory API error: ${response.statusCode}');
    }
  }

  String getWindDirectionTranslation(String apiValue, BuildContext context) {
    final direction = apiValue;
    switch (direction) {
      case 'N': return S.of(context).n;
      case 'S': return S.of(context).s;
      case 'E': return S.of(context).e;
      case 'W': return S.of(context).w;
      case 'NE': return S.of(context).ne;
      case 'SE': return S.of(context).se;
      case 'SW': return S.of(context).sw;
      case 'NW': return S.of(context).nw;
      case 'NNE': return S.of(context).nne;
      case 'ENE': return S.of(context).ene;
      case 'ESE': return S.of(context).ese;
      case 'SSE': return S.of(context).sse;
      case 'SSW': return S.of(context).ssw;
      case 'WSW': return S.of(context).wsw;
      case 'WNW': return S.of(context).wnw;
      case 'NNW': return S.of(context).nnw;

      default: return direction;
    }
  }
}