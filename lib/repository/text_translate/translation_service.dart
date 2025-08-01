import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

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
}