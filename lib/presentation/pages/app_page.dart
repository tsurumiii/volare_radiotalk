import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:provider/provider.dart';
import 'package:volare_radiotalk/model/firestore_model/user/user.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
import 'package:volare_radiotalk/model/notifier/post/post_notifier.dart';
import 'package:volare_radiotalk/presentation/pages/app_page_notifier.dart';
import 'package:volare_radiotalk/presentation/widget/index.dart';

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

    final playState = context.select((PlayRadioPageState state) => state);
    final playNotifier = context.watch<PlayRadioPageNotifier>();
    final currentUser = context.select((UserState state) => state.user);
    return WillPopScope(
      onWillPop: notifier.onWillPop,
      child: Scaffold(
        body: SlidingUpPanel(
          onPanelClosed: () {
            playNotifier
              ..stopPlayer()
              ..setPost(null);
          },
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
            return _playRadio(context, sc, playState, currentUser);
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

  Widget _playRadio(BuildContext context, ScrollController sc,
      PlayRadioPageState playState, User currentUser) {
    final notifier = context.read<AppPageNotifier>();
    final playNotifier = context.read<PlayRadioPageNotifier>();
    final postNotifier = context.read<PostNotifier>();
    if (playState.post == null) {
      return const SizedBox();
    }
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
                playNotifier
                  ..stopPlayer()
                  ..setPost(null);
              },
            ),
          ],
        ),
        Image(
          image: NetworkImage(
            playState.post.postImage == null
                ? noImage
                : playState.post.postImage.url,
          ),
          width: context.deviceWidth,
          height: context.deviceWidth * 0.5,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image(
                  image: NetworkImage(playState.post.userImage == null
                      ? noImage
                      : playState.post.userImage.url),
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                playState.post.radioName ?? '',
                style: const TextStyle(
                  color: kAppWhite,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                playState.post.title ?? '',
                style: const TextStyle(
                  color: kAppWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                DateHelper.format(
                  playState.post.createdAt.toDate(),
                  format: 'yyyy-MM-dd HH:mm:ss',
                ),
                style: const TextStyle(
                  color: kAppWhite,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Slider(
                activeColor: kAppYellow100,
                inactiveColor: kAppGray50,
                value:
                    min(playState.sliderCurrentPosition, playState.maxDuration),
                min: 0,
                max: playState.maxDuration,
                onChanged: (value) async {
                  print(value);
                  await playNotifier.seekToPlayer(value.toInt());
                },
                divisions: playState.maxDuration == 0.0
                    ? 1
                    : playState.maxDuration.toInt(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      playState.playerTxt,
                      style: const TextStyle(
                        color: kAppWhite,
                      ),
                    ),
                    Text(
                      playNotifier.maxDuration(),
                      style: const TextStyle(
                        color: kAppWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: const SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundColor: kAppYellow100,
                  child: Icon(
                    Icons.replay_10,
                    color: kAppWhite500,
                  ),
                ),
              ),
              onTap: () {
                playNotifier.back10seconds();
              },
            ),
            InkWell(
              child: SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundColor: kAppYellow100,
                  child: _icon(context, playState.playType),
                ),
              ),
              onTap: () {
                if (playState.playType == PlayType.stop) {
                  playNotifier.play();
                } else if (playState.playType == PlayType.start ||
                    playState.playType == PlayType.resume) {
                  playNotifier.pausePlayer();
                } else if (playState.playType == PlayType.pause) {
                  playNotifier.resumePlayer();
                }
              },
            ),
            InkWell(
              child: const SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundColor: kAppYellow100,
                  child: Icon(
                    Icons.forward_10,
                    color: kAppWhite500,
                  ),
                ),
              ),
              onTap: () {
                playNotifier.next10seconds();
              },
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        if (playState.post.uid == currentUser.uid)
          Center(
            child: Button(
              text: '削除する',
              onTap: () {
                postNotifier.delete(playState.post.id);
                notifier.panelController.close();
                playNotifier
                  ..stopPlayer()
                  ..setPost(null);
              },
              isEnable: true,
              color: kAppRed400,
            ),
          ),
      ],
    );
  }

  Widget _icon(BuildContext context, PlayType playType) {
    if (playType == PlayType.stop || playType == PlayType.pause) {
      return const Icon(
        Icons.play_arrow,
        color: kAppWhite500,
        size: 28,
      );
    } else if (playType == PlayType.start || playType == PlayType.resume) {
      return const Icon(
        Icons.stop,
        color: kAppWhite500,
        size: 28,
      );
    }
  }
}
