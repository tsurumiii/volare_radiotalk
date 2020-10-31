import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volare_radiotalk/common/master/colors.dart';
import 'package:volare_radiotalk/common/extension/context_extension.dart';

class ThemeHelper with Mixin {
  static ThemeData appTheme(BuildContext context) =>
      context.isDark ? appThemeDark() : appThemeLight();
  static Brightness brightness(BuildContext context) =>
      context.isDark ? Brightness.dark : Brightness.light;
  static ThemeData appThemeLight() {
    final base = ThemeData.light();
    return base.copyWith(
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
//    dialogBackgroundColor: kAppBlack50,
//    canvasColor: kAppBlack50,
      accentColor: kAppTheme,
//    buttonColor: kAppBlue50,
//    scaffoldBackgroundColor: kAppBlack50,
//    cardColor: kAppBlack50,
//    errorColor: kAppPink400,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kAppTheme,
        textTheme: ButtonTextTheme.normal,
      ),
      cursorColor: Colors.grey,
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: Colors.grey,
      ),
//    primaryIconTheme: base.iconTheme.copyWith(
//        color: kAppBlue150
//    ),
      textTheme: _appTextTheme(base.textTheme),
//    primaryTextTheme: _appTextTheme(base.primaryTextTheme),
    );
  }

  static ThemeData appThemeDark() {
    final base = ThemeData.from(colorScheme: const ColorScheme.dark());
    return base.copyWith(
//    dialogBackgroundColor: kAppBlack50,
//    canvasColor: kAppBlack50,
      accentColor: kAppTheme,
//    buttonColor: kAppBlue50,
//    scaffoldBackgroundColor: kAppBlack50,
//    cardColor: kAppBlack50,
//    errorColor: kAppPink400,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kAppBlack50,
        textTheme: ButtonTextTheme.normal,
      ),
      cursorColor: Colors.blueAccent,
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: Colors.blueAccent,
      ),
//    primaryIconTheme: base.iconTheme.copyWith(
//        color: kAppBlue150
//    ),
      textTheme: _appTextTheme(base.textTheme),
//    primaryTextTheme: _appTextTheme(base.primaryTextTheme),
    );
  }

  static TextTheme _appTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline1: base.headline1.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 42,
          ),
          headline2: base.headline2
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),

          /// 普通のテキスト
          bodyText1: base.bodyText1.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          bodyText2: base.bodyText2.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
        );
  }
}

mixin Mixin {
  Color iconColor(BuildContext context) =>
      context.isDark ? Colors.white : Colors.black;
  Color defaultColor(BuildContext context) =>
      context.isDark ? Colors.white : Colors.black;
  Color backgroundColor(BuildContext context) =>
      context.isDark ? ThemeData.dark().backgroundColor : Colors.white;
}
