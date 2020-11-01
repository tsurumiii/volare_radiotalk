import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/app.dart';
import 'package:volare_radiotalk/app_config.dart';
import 'package:volare_radiotalk/di_container.dart';

Future<void> main() async {
  await configure();
  runApp(
    MultiProvider(
      providers: providers,
      child: App(),
    ),
  );
}
