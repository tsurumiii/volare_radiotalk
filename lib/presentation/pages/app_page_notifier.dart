import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/app_tab_navigator.dart';
import 'package:volare_radiotalk/presentation/pages/home/home_page.dart';
import 'package:volare_radiotalk/presentation/pages/recording/recording_page.dart';

import 'myPage/my_page.dart';

part 'app_page_notifier.freezed.dart';

@freezed
abstract class AppPageState with _$AppPageState {
  const factory AppPageState({
    int selectedIndex,
  }) = _AppPageState;
}

class AppPageNotifier extends StateNotifier<AppPageState> with LocatorMixin {
  AppPageNotifier({
    @required this.context,
  }) : super(const AppPageState(
          selectedIndex: 0,
        )) {
    _configure();
  }

  final BuildContext context;
  PanelController panelController = PanelController();

  final List<TabWidgetPage> widgetList = [
    const HomePage(),
    const MyPage(),
  ];

  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };

  void onItemTapped(int index) async {
    widgetList[index].onBottomNavigationTap();
    state = state.copyWith(selectedIndex: index);
  }

  Future<bool> onWillPop() async {
    final keyTab = navigatorKeys[state.selectedIndex];
    if (keyTab.currentState.canPop()) {
      return !await keyTab.currentState.maybePop();
    }
    return Future.value(true);
  }

  Widget buildOffstageNavigator(int index) {
    return Offstage(
      offstage: index != state.selectedIndex,
      child: TabNavigator(
        navigatorKey: navigatorKeys[index],
        page: widgetList[index],
      ),
    );
  }

  Future _configure() async {
    // nothing
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      elevation: 0,
      barrierColor: kAppWhite.withOpacity(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: kAppBlack50,
      builder: (context) => Container(
        height: context.deviceHeight * 0.3,
        decoration: const BoxDecoration(
          color: kAppBlack50,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute<void>(
                    builder: (_) => RecordingPage.wrapped(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: SizedBox(
                height: 120,
                width: 120,
                child: CircleAvatar(
                  backgroundColor: kAppYellow100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.record_voice_over,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'TALK',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   width: 50,
            // ),
            // SizedBox(
            //   height: 120,
            //   width: 120,
            //   child: CircleAvatar(
            //     backgroundColor: kAppOrange100,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: const [
            //         Icon(
            //           Icons.flash_on_outlined,
            //           size: 20,
            //           color: kAppWhite,
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           'LIVE',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: kAppWhite,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
