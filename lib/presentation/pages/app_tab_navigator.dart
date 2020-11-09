import 'package:flutter/material.dart';

abstract class TabWidgetPage extends StatefulWidget {
  const TabWidgetPage({Key key}) : super(key: key);
  void onBottomNavigationTap();
}

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    Key key,
    this.navigatorKey,
    this.page,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final TabWidgetPage page;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex = 500}) {
    return {
      TabNavigatorRoutes.root: (context) => page,
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute<StatefulWidget>(
          builder: routeBuilders[routeSettings.name],
        );
      },
    );
  }
}
