import 'dart:io';

import 'package:flutter/material.dart';
import 'package:volare_radiotalk/model/firestore_model/user/index.dart' as user;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
part 'profile_page_notifier.freezed.dart';

@freezed
abstract class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState({
    File image,
    @Default(false) bool isImageUrl,
    @Default('') String radioName,
    @Default('') String selfIntroduction,
    @Default(true) bool isLoading,
  }) = _ProfilePageState;
}

class ProfilePageNotifier extends StateNotifier<ProfilePageState>
    with LocatorMixin {
  ProfilePageNotifier({
    @required this.context,
  }) : super(const ProfilePageState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  final BuildContext context;

  user.User get currentUser => read<UserNotifier>().state.user;
  UserNotifier get userNotifier => read<UserNotifier>();

  TextEditingController radioNameController = TextEditingController();
  TextEditingController selfIntoroController = TextEditingController();

  Future<void> _configure() async {
    state = state.copyWith(isImageUrl: currentUser.userImage != null);

    radioNameController.text = currentUser.radioName;
    selfIntoroController.text = currentUser.selfIntroduction;
    state = state.copyWith(
      image: null,
      radioName: currentUser.radioName,
      selfIntroduction: currentUser.selfIntroduction,
    );

    state = state.copyWith(isLoading: false);
  }

  void setImageFile(File image) {
    state = state.copyWith(image: image, isImageUrl: true);
  }

  void setRadioName(String radioName) {
    state = state.copyWith(radioName: radioName);
  }

  void setSelfIntro(String selfIntroduction) {
    state = state.copyWith(selfIntroduction: selfIntroduction);
  }

  Future<void> editProfile() async {
    print(state.radioName);
    print(state.selfIntroduction);
    print(state.image);
    await userNotifier.updateUser(
      radioName: state.radioName,
      selfIntroduction: state.selfIntroduction,
      image: state.image,
    );
    Navigator.pop(context);
  }
}
