import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:volare_radiotalk/common/helper/locale_helper.dart';
import 'l10n_delegate.dart';
import 'messages.dart';
import 'messages_all.dart';

class L10n with Messages {
  static Future<L10n> load(Locale locale) async {
//    final name = locale.countryCode == null || locale.countryCode.isEmpty
//        ? locale.languageCode
//        : locale.toString();
//    final localeName = Intl.canonicalizedLocale(name);
    final localeName = LocaleHelper.isJapanese() ? 'ja' : 'en';
    print('localeName $localeName');
    // 言語リソース読み込み
    await initializeMessages(localeName);
    // デフォルト言語を設定
    Intl.defaultLocale = localeName;
    // 自身を返す
    return L10n();
  }

  // Widgetツリーから自身を取り出す
  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = L10nDelegate();
}
