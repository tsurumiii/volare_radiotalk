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
  CollectionPagingListener<Post> _collectionPagingListener;

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
    _collectionPagingListener = CollectionPagingListener<Post>(
      query: firestoreInstance.collectionGroup('posts'),
      initialLimit: 100,
      pagingLimit: 100,
      decode: (snap) => Post(snapshot: snap),
    )
      ..fetch()
      ..data.listen((event) async {
        print('fetchPosts listen');
        final data = event.map((e) => e).toList()
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

        print(data.length);
        state = state.copyWith(postList: data);
      });
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

  Future<void> delete(String id) async {
    final uid = currentUser.uid;
    final ref = user.User(id: uid).posts.ref;
    final post = Post(id: id, collectionRef: ref);
    final batch = Batch()..delete(post);
    await batch.commit();
  }
}
