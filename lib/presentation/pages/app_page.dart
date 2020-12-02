import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/presentation/pages/app_page_notifier.dart';

class AppPage extends StatelessWidget {
  const AppPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<AppPageNotifier, AppPageState>(
          create: (context) => AppPageNotifier(
            context: context,
          ),
        ),
      ],
      child: const AppPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<AppPageNotifier>();
    return WillPopScope(
      onWillPop: notifier.onWillPop,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            notifier.buildOffstageNavigator(0),
            notifier.buildOffstageNavigator(1),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: kAppGray50,
              ),
              activeIcon: Icon(
                Icons.home,
                color: kAppWhite,
              ),
              label: 'ホーム',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: kAppGray50,
              ),
              activeIcon: Icon(
                Icons.person,
                color: kAppWhite,
              ),
              label: 'マイページ',
            ),
          ],
          selectedItemColor: kAppWhite,
          unselectedItemColor: kAppGray50,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          currentIndex:
              context.select((AppPageState state) => state.selectedIndex),
          onTap: notifier.onItemTapped,
          backgroundColor: kAppBlack50,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () {
            notifier.showBottomSheet(context);
          },
          child: const SizedBox(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundColor: kAppYellow100,
              child: Icon(
                Icons.mic,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
