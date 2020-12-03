import 'dart:io';

import 'package:flamingo/flamingo.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/firestore_model/user/index.dart' as user;
import 'package:volare_radiotalk/model/firestore_model/user/post.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
import 'package:volare_radiotalk/model/notifier/post/post_state.dart';

class PostNotifier extends StateNotifier<PostState> with LocatorMixin {
  PostNotifier() : super(const PostState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  DocumentAccessorRepository get documentAccessorRepository =>
      read<DocumentAccessorRepository>();

  user.User get currentUser => read<UserNotifier>().state.user;
  final _storage = Storage();

  void _configure() {
    _storage
      ..fetch()
      ..uploader.listen((data) {
        print('transferred: ${data.bytesTransferred}');
      });
  }

  Future<void> fetchPosts() async {
    final data = user.User().posts;
  }

  Future<void> sendPost({String title, String detail, String filePath}) async {
    print('called sendPost');
    try {
      final ref = user.User(id: currentUser.uid).posts.ref;

      final now = Timestamp.fromDate(DateTime.now());
      final path = '${currentUser.documentPath}/${now.nanoseconds}';
      final file = File(filePath);
      final postFile =
          await _storage.save(path, file, filename: '${now.nanoseconds}.acc');

      final post = Post(collectionRef: ref)
        ..title = title
        ..detail = detail
        ..post = postFile;

      final batch = Batch()..save(post);
      await batch.commit();
    } catch (e) {
      print(e);
    }
  }
}
