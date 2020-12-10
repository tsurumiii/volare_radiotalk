import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:recorder_wav/recorder_wav.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:volare_radiotalk/presentation/pages/post/post_page.dart';

part 'recording_page_notifier.freezed.dart';

@freezed
abstract class RecordingPageState with _$RecordingPageState {
  const factory RecordingPageState({
    @Default(false) bool isLoading,
    @Default(false) bool isRedording,
    @Default(false) bool mPlayerIsInited,
    @Default(false) bool mRecorderIsInited,
    @Default(false) bool mplaybackReady,
    @Default('') String mPath,
  }) = _RecordingPageState;
}

class RecordingPageNotifier extends StateNotifier<RecordingPageState>
    with LocatorMixin {
  RecordingPageNotifier({
    @required this.context,
  }) : super(const RecordingPageState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  final BuildContext context;
  StopWatchTimer stopWatchTimer = StopWatchTimer();
  // FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();

  Future<void> _configure() async {
    // await _mPlayer.openAudioSession().then((value) {
    //   state = state.copyWith(mPlayerIsInited: true);
    // });
    await openTheRecorder().then((value) {
      state = state.copyWith(mRecorderIsInited: true);
    });
  }

  Future<void> openTheRecorder() async {
    final tempDir = await getTemporaryDirectory();
    final _mPath = '${tempDir.path}/flutter_sound_example.aac';
    state = state.copyWith(mPath: _mPath);
    final outputFile = File(_mPath);
    if (outputFile.existsSync()) {
      await outputFile.delete();
    }
    await _mRecorder.openAudioSession();
    state = state.copyWith(mRecorderIsInited: true);
  }

  @override
  void dispose() {
    // stopPlayer();
    // _mPlayer.closeAudioSession();
    // _mPlayer = null;

    stopRecorder();
    _mRecorder.closeAudioSession();
    _mRecorder = null;
    if (state.mPath != null) {
      final outputFile = File(state.mPath);
      if (outputFile.existsSync()) {
        outputFile.delete();
      }
    }
    super.dispose();
  }

  Future<void> record() async {
    assert(state.mRecorderIsInited);
    await _mRecorder.startRecorder(
      toFile: state.mPath,
      codec: Codec.aacADTS,
    );
    state = state.copyWith(isRedording: true);
    stopWatchTimer.minuteTime.listen((value) {
      if (value == 12) {
        stopRecorder();
      }
    });
    stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  Future<void> stopRecorder() async {
    stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    state = state.copyWith(isRedording: false);
    await _mRecorder.stopRecorder();
    if (!mounted) {
      return;
    }

    state = state.copyWith(mplaybackReady: true);
    print(state.mPath);
    await Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (_) => PostPage.wrapped(state.mPath),
      ),
    );
  }

  // void play() async {
  //   assert(state.mPlayerIsInited &&
  //       state.mplaybackReady &&
  //       _mRecorder.isStopped &&
  //       _mPlayer.isStopped);
  //   await _mPlayer.startPlayer(
  //       fromURI: state.mPath, codec: Codec.mp3, whenFinished: () {});
  // }

  // Future<void> stopPlayer() async {
  //   await _mPlayer.stopPlayer();
  // }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      final status = await Permission.microphone.request();
      print(status);
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
}
