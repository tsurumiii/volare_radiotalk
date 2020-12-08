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
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    print('called fetchPosts');
    final data = await firestoreInstance
        .collectionGroup('posts')
        // .orderBy('createdAt', descending: true)
        .get();
    final postList = data.docs.map((e) => Post(snapshot: e)).toList();
    print(postList);
    postList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    state = state.copyWith(postList: postList);
  }

  Future<void> sendPost(
      {String title, String detail, String filePath, File postImage}) async {
    print('called sendPost');
    try {
      final now = Timestamp.fromDate(DateTime.now());
      StorageFile postImageFile;
      if (postImage != null) {
        final path = '${currentUser.documentPath}/postImage/${now.nanoseconds}';
        postImageFile = await _storage.save(path, postImage);
      }
      final ref = user.User(id: currentUser.uid).posts.ref;

      final path = '${currentUser.documentPath}/${now.nanoseconds}';
      final file = File(filePath);
      final postFile =
          await _storage.save(path, file, filename: '${now.nanoseconds}.acc');

      final post = Post(collectionRef: ref)
        ..uid = currentUser.uid
        ..radioName = currentUser.radioName
        ..userImage = currentUser.userImage
        ..title = title
        ..detail = detail
        ..post = postFile
        ..postImage = postImageFile;

      final batch = Batch()..save(post);
      await batch.commit();
    } catch (e) {
      print(e);
    }
  }
}
