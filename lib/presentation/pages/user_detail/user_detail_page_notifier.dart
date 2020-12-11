import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/firestore_model/user/index.dart';
import 'package:volare_radiotalk/model/firestore_model/user/post.dart';

part 'user_detail_page_notifier.freezed.dart';

@freezed
abstract class UserDetailPageState with _$UserDetailPageState {
  const factory UserDetailPageState({
    User user,
    @Default(<Post>[]) List<Post> postList,
  }) = _UserDetailPageState;
}

class UserDetailPageNotifier extends StateNotifier<UserDetailPageState>
    with LocatorMixin {
  UserDetailPageNotifier({
    @required this.context,
    @required this.user,
  }) : super(const UserDetailPageState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  final BuildContext context;
  final User user;

  Future<void> _configure() async {
    state = state.copyWith(user: user);
    await fetchPostList();
  }

  Future<void> fetchPostList() async {
    final data = await user.posts.ref.get();
    final snapShot = data.docs.toList();
    final postList = snapShot.map((e) => Post(snapshot: e)).toList();
    print(postList);
    state = state.copyWith(postList: postList);
  }
}
