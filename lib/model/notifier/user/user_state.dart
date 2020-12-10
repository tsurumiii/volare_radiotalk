import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volare_radiotalk/model/firestore_model/user/post.dart';
import 'package:volare_radiotalk/model/firestore_model/user/user.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    User user,
    @Default(<Post>[]) List<Post> posts,
  }) = _UserState;
}
