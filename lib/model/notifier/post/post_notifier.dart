import 'package:flamingo/flamingo.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/firestore_model/user/index.dart' as user;
import 'package:volare_radiotalk/model/notifier/post/post_state.dart';

class PostNotifier extends StateNotifier<PostState> with LocatorMixin {
  PostNotifier() : super(const PostState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  DocumentAccessorRepository get documentAccessorRepository =>
      read<DocumentAccessorRepository>();

  void _configure() {}

  Future<void> fetchPosts() async {
    final data = user.User().post;
  }
}
