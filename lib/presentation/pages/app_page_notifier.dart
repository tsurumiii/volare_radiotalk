import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/app_tab_navigator.dart';
import 'package:volare_radiotalk/presentation/pages/home/home_page.dart';

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
}
