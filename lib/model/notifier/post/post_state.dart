import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volare_radiotalk/model/firestore_model/user/post.dart';

part 'post_state.freezed.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    @Default(<Post>[]) List<Post> postList,
  }) = _PostState;
}
