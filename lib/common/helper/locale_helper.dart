import 'package:devicelocale/devicelocale.dart';

bool _isJapanese = true;

class LocaleHelper {
  const LocaleHelper._();
  static bool isJapanese() => _isJapanese;

  static Future<void> configure() async {
    final languages = await LocaleHelper.language();
    if (languages.first is String) {
      final item = languages.first as String;
      if (item.contains('ja')) {
        _isJapanese = true;
        return;
      }
    }
    _isJapanese = false;
  }

  static Future<List<dynamic>> language() async {
    final languages = await Devicelocale.preferredLanguages;
    return languages;
  }

}