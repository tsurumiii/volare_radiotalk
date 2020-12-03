import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/presentation/pages/recording/recording_page_notifier.dart';

class RecordingPage extends StatelessWidget {
  const RecordingPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<RecordingPageNotifier, RecordingPageState>(
          create: (context) => RecordingPageNotifier(
            context: context,
          ),
        ),
      ],
      child: const RecordingPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBlack50,
      appBar: AppBar(
        backgroundColor: kAppBlack50,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final notifier = context.watch<RecordingPageNotifier>();
    final isRedording =
        context.select((RecordingPageState state) => state.isRedording);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: context.deviceHeight * 0.7,
          width: context.deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  context.l10n.recordingPageText,
                  style: const TextStyle(
                    color: kAppWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  final isRedording =
                      context.read<RecordingPageState>().isRedording;
                  print(isRedording);
                  if (!isRedording) {
                    notifier.record();
                  } else {
                    notifier.stopRecorder();
                  }
                },
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    backgroundColor: kAppGray50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.mic,
                          size: 40,
                          color: kAppWhite,
                        ),
                        !isRedording
                            ? Text(
                                context.l10n.recordingStart,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kAppWhite,
                                ),
                              )
                            : StreamBuilder<int>(
                                stream: notifier.stopWatchTimer.rawTime,
                                initialData: 0,
                                builder: (context, snapshot) {
                                  final value = snapshot.data;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    milliSecond: false,
                                    hours: false,
                                  );
                                  return Text(
                                    displayTime,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAppWhite,
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
