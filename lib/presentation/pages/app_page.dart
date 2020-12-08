import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/presentation/pages/app_page_notifier.dart';

import 'play_radio/play_radio_page_notifier.dart';

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
        StateNotifierProvider<PlayRadioPageNotifier, PlayRadioPageState>(
          create: (context) => PlayRadioPageNotifier(
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
        body: SlidingUpPanel(
          controller: notifier.panelController,
          minHeight: 0,
          maxHeight: context.deviceHeight * 0.95,
          backdropEnabled: true,
          color: kAppWhite500,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          panelBuilder: (sc) {
            return _playRadio(context, sc);
          },
          body: Scaffold(
            body: Stack(
              children: [
                Stack(
                  children: <Widget>[
                    notifier.buildOffstageNavigator(0),
                    notifier.buildOffstageNavigator(1),
                  ],
                ),
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
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
        ),
      ),
    );
  }

  Widget _playRadio(BuildContext context, ScrollController sc) {
    final notifier = context.read<AppPageNotifier>();
    final playNotifier = context.read<PlayRadioPageNotifier>();
    return ListView(
      padding: const EdgeInsets.all(0),
      controller: sc,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.close,
                color: kAppWhite,
              ),
              onPressed: () {
                notifier.panelController.close();
              },
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.play_arrow,
            color: kAppWhite,
          ),
          onPressed: () {
            playNotifier.play();
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.stop,
            color: kAppWhite,
          ),
          onPressed: () {
            playNotifier.stopPlayer();
          },
        ),
      ],
    );
  }
}
