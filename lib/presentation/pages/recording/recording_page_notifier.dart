import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  Future<void> _configure() async {}

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

  Future<void> startRecord() async {
    final hasPermission = await checkPermission();
    if (hasPermission) {
      print('hasPermission: $hasPermission');

      RecorderWav.startRecorder();
      state = state.copyWith(isRedording: true);
      stopWatchTimer.minuteTime.listen((value) {
        if (value == 12) {
          stopRecord();
        }
      });
      stopWatchTimer.onExecute.add(StopWatchExecute.start);
    }
  }

  Future<void> stopRecord() async {
    stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    state = state.copyWith(isRedording: false);
    final filePath = await RecorderWav.StopRecorder();
    print(filePath);
    await Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (_) => PostPage.wrapped(filePath),
      ),
    );
  }
}
