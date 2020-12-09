import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/firestore_model/user/post.dart';
part 'play_radio_page_notifier.freezed.dart';

enum PlayType {
  start,
  pause,
  resume,
  stop,
}

@freezed
abstract class PlayRadioPageState with _$PlayRadioPageState {
  const factory PlayRadioPageState({
    @Default(true) bool isLoading,
    @Default(false) bool mPlayerIsInited,
    @Default(false) bool mplaybackReady,
    @Default('') String fromUrl,
    Post post,
    @Default(0) double sliderCurrentPosition,
    @Default(1) double maxDuration,
    @Default(false) bool isPlaying,
    @Default(PlayType.stop) PlayType playType,
    @Default('00:00:00') String playerTxt,
    @Default(0) int currentMilliseconds,
  }) = _PlayRadioPageState;
}

class PlayRadioPageNotifier extends StateNotifier<PlayRadioPageState>
    with LocatorMixin {
  PlayRadioPageNotifier({
    @required this.context,
  }) : super(PlayRadioPageState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  FlutterSoundPlayer mPlayer = FlutterSoundPlayer();
  StreamSubscription _playerSubscription;
  final BuildContext context;

  Future<void> _configure() async {
    await mPlayer.openAudioSession().then((value) {
      state = state.copyWith(mPlayerIsInited: true);
    });
    await mPlayer.setSubscriptionDuration(const Duration(milliseconds: 10));
  }

  @override
  void dispose() {
    stopPlayer();
    mPlayer.closeAudioSession();
    mPlayer = null;
    super.dispose();
  }

  void setUrl(String url) {
    state = state.copyWith(fromUrl: url);
  }

  void setPost(Post post) {
    state = state.copyWith(post: post);
  }

  void cancelPlayerSubscriptions() {
    if (_playerSubscription != null) {
      _playerSubscription.cancel();
      _playerSubscription = null;
    }
  }

  void _addListeners() {
    print('_addListeners');
    cancelPlayerSubscriptions();
    _playerSubscription = mPlayer.onProgress.listen((e) async {
      if (e != null) {
        final maxDuration = e.duration.inMilliseconds.toDouble();
        state = state.copyWith(maxDuration: maxDuration);
        if (maxDuration <= 0) {
          state = state.copyWith(maxDuration: 0);
        }

        final sliderCurrentPosition =
            min(e.position.inMilliseconds.toDouble(), maxDuration);
        state = state.copyWith(sliderCurrentPosition: sliderCurrentPosition);
        if (sliderCurrentPosition < 0.0) {
          state = state.copyWith(sliderCurrentPosition: 0);
        }

        final date = DateTime.fromMillisecondsSinceEpoch(
            e.position.inMilliseconds,
            isUtc: true);
        final txt = DateFormat('mm:ss:SS', 'en_GB').format(date);

        final _playerTxt = txt.substring(0, 8);
        print(_playerTxt);
        // await Future<void>.delayed(const Duration(milliseconds: 500));
        state = state.copyWith(
            playerTxt: _playerTxt,
            currentMilliseconds: e.position.inMilliseconds);
        print(e.position.inMilliseconds);
      }
    });
  }

  Future<void> seekToPlayer(int milliSecs) async {
    if (mPlayer.isPlaying) {
      await mPlayer.seekToPlayer(Duration(milliseconds: milliSecs));
    }
  }

  String maxDuration() {
    final date = DateTime.fromMillisecondsSinceEpoch(state.maxDuration.toInt(),
        isUtc: true);
    final txt = DateFormat('mm:ss:SS', 'en_GB').format(date);

    final _playerTxt = txt.substring(0, 8);
    return _playerTxt;
  }

  Future<void> next10seconds() async {
    if (mPlayer.isPlaying) {
      await mPlayer.seekToPlayer(
          Duration(milliseconds: state.currentMilliseconds + 10000));
    }
  }

  Future<void> back10seconds() async {
    if (mPlayer.isPlaying) {
      await mPlayer.seekToPlayer(
          Duration(milliseconds: state.currentMilliseconds - 10000));
    }
  }

  Future<void> play() async {
    state = state.copyWith(playType: PlayType.start);
    await mPlayer.startPlayer(
      fromURI: state.fromUrl,
      codec: Codec.aacADTS,
      whenFinished: () {
        state = state.copyWith(playType: PlayType.stop);
      },
    );
    _addListeners();
  }

  Future<void> stopPlayer() async {
    state = state.copyWith(playType: PlayType.stop);
    await mPlayer.stopPlayer();
    if (_playerSubscription != null) {
      await _playerSubscription.cancel();
      _playerSubscription = null;
    }
    state = state.copyWith(
        sliderCurrentPosition: 0,
        playerTxt: '00:00:00',
        currentMilliseconds: 0);
  }

  Future<void> pausePlayer() async {
    state = state.copyWith(playType: PlayType.pause);
    await mPlayer.pausePlayer();
  }

  Future<void> resumePlayer() async {
    state = state.copyWith(playType: PlayType.resume);
    await mPlayer.resumePlayer();
  }
}
