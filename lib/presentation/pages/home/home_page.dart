import 'package:flutter/material.dart';

import '../app_tab_navigator.dart';

class HomePage extends TabWidgetPage {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  @override
  void onBottomNavigationTap() {}
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
    );
  }
}
