import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'play_radio_page_notifier.freezed.dart';

@freezed
abstract class PlayRadioPageState with _$PlayRadioPageState {
  const factory PlayRadioPageState({
    @Default(true) bool isLoading,
    @Default(false) bool mPlayerIsInited,
    @Default(false) bool mplaybackReady,
    @Default('') String fromUrl,
  }) = _PlayRadioPageState;
}

class PlayRadioPageNotifier extends StateNotifier<PlayRadioPageState>
    with LocatorMixin {
  PlayRadioPageNotifier({
    @required this.context,
  }) : super(const PlayRadioPageState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  final BuildContext context;

  Future<void> _configure() async {
    await _mPlayer.openAudioSession().then((value) {
      state = state.copyWith(mPlayerIsInited: true);
    });
  }

  @override
  void dispose() {
    stopPlayer();
    _mPlayer.closeAudioSession();
    _mPlayer = null;
    super.dispose();
  }

  void setUrl(String url) {
    state = state.copyWith(fromUrl: url);
    print(url);
  }

  void play() async {
    await _mPlayer.startPlayer(
        fromURI: state.fromUrl, codec: Codec.aacADTS, whenFinished: () {});
  }

  Future<void> stopPlayer() async {
    await _mPlayer.stopPlayer();
  }
}
