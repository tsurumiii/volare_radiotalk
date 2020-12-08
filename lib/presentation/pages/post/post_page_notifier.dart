import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/notifier/post/post_notifier.dart';

part 'post_page_notifier.freezed.dart';

@freezed
abstract class PostPageState with _$PostPageState {
  const factory PostPageState({
    File postImage,
    @Default('') String title,
    @Default('') String detail,
  }) = _PostPageState;
}

class PostPageNotifier extends StateNotifier<PostPageState> with LocatorMixin {
  PostPageNotifier({
    @required this.context,
    @required this.filePath,
  }) : super(const PostPageState());

  PostNotifier get postNotifier => read<PostNotifier>();

  final BuildContext context;
  final String filePath;

  void onChangeTitle(String title) {
    state = state.copyWith(title: title);
  }

  void onChangeDetail(String detail) {
    state = state.copyWith(detail: detail);
  }

  Future<void> sendPost() async {
    print('called sendPost');
    await postNotifier.sendPost(
        title: state.title,
        detail: state.detail,
        filePath: filePath,
        postImage: state.postImage);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void setImageFile(File image) {
    state = state.copyWith(postImage: image);
  }
}
