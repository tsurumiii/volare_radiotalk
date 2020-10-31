import 'package:flutter/material.dart';

class Assets {
  const Assets._();
  static const AssetImage sampleAbundance =
      AssetImage('assets/sample/abundance.jpg');
  static Image userIcon = Image.asset('assets/drawable/user_icon.png');
  static Image qrIcon = Image.asset('assets/drawable/qr_icon.png');
  static Image confirmIcon = Image.asset('assets/drawable/confirm_icon.png');
  static Image favoriteIcon = Image.asset('assets/drawable/favorite_icon.png');
  static Image searchIcon = Image.asset('assets/drawable/search_icon.png');
  static Image alertIcon = Image.asset('assets/drawable/icon_alert.png');
  static AssetImage mapIcon = const AssetImage(
    'assets/drawable/icon_map.png',
  );
  static Image japanMapIcon = Image.asset('assets/drawable/map.png');
  static Image calenderIcon = Image.asset('assets/drawable/day.png');
  static Image timeIcon = Image.asset('assets/drawable/time.png');
  static Image moneyIcon = Image.asset('assets/drawable/yen.png');
  static Image workingFromIcon =
      Image.asset('assets/drawable/icon_working_from.png');
  static Image licenseIcon = Image.asset('assets/drawable/icon_license.png');
  static Image menuIcon = Image.asset('assets/drawable/icon_menu.png');
  static Image active = Image.asset('assets/drawable/active.png');
  static AssetImage searchDemo =
      const AssetImage('assets/drawable/search_demo.png');
  static const AssetImage demoLicense =
      AssetImage('assets/sample/demo-license.jpg');
  static const AssetImage addPhotoIcon =
      AssetImage('assets/drawable/add_photo_icon.png');
}
