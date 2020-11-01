import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/l10n/l10n.dart';
import 'package:volare_radiotalk/presentation/pages/auth/auth_page.dart';
import 'package:volare_radiotalk/presentation/pages/index.dart';
import 'package:volare_radiotalk/presentation/route/route_observer.dart';
import 'package:volare_radiotalk/presentation/widget/index.dart';

import 'model/notifier/index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: context.watch(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[routeObserver],
      localizationsDelegates: const [
        L10n.delegate,
        RefreshLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        return const Locale('ja');
      },
      home: MultiProvider(
        providers: [
          StateNotifierProvider<AuthNotifier, AuthState>(
            create: (context) => AuthNotifier(
              context: context,
            ),
          ),
        ],
        child: const RootPage(),
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterBuild);
  }

  void _afterBuild(Duration duration) async {
    final authNotifier = context.read<AuthNotifier>();
    final result = await authNotifier.startUp();
    if (result == StartUpType.loggedInUser) {
      _showMainPage();
    } else {
      _showLoginPage();
    }
  }

  void _showMainPage() => Navigator.of(context, rootNavigator: true)
          .pushReplacement<MaterialPageRoute, void>(MaterialPageRoute(
        builder: (_) => AppPage(),
      ));

  void _showLoginPage() => Navigator.of(context, rootNavigator: true)
          .pushReplacement<MaterialPageRoute, void>(MaterialPageRoute(
        builder: (_) => AuthPage(),
      ));

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircularProgressIndicatorProvider(
        child: SizedBox.shrink(),
        isLoading: true,
      ),
    );
  }
}
