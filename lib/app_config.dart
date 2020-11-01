import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/helper/locale_helper.dart';

Future configure() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Flamingo
  await Flamingo.initializeApp();

  /// 縦固定
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  /// 端末の言語確認
  await LocaleHelper.configure();
}
