import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flamingo/flamingo.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/firestore_model/user/index.dart' as user;
import 'package:volare_radiotalk/model/firestore_model/user/index.dart';
import 'package:volare_radiotalk/model/notifier/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> with LocatorMixin {
  UserNotifier() : super(const UserState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  DocumentAccessorRepository get documentAccessorRepository =>
      read<DocumentAccessorRepository>();
  final _storage = Storage();

  void _configure() {
    _storage
      ..fetch()
      ..uploader.listen((data) {
        print('transferred: ${data.bytesTransferred}');
      });
  }

  Future<void> createUser(UserCredential userCredential) async {
    final newUser = user.User(id: userCredential.user.uid)
      ..uid = userCredential.user.uid
      ..email = userCredential.user.email
      ..radioName = 'DJトクメイ'
      ..userImage = null
      ..selfIntroduction = 'ここに自己紹介を書いてね';
    await documentAccessorRepository.save(newUser);
  }

  Future<void> fetchUser(String uid) async {
    print('called fetchUser');
    final data =
        await documentAccessorRepository.load<user.User>(user.User(id: uid));
    state = state.copyWith(user: data);
  }

  Future<void> updateUser(
      {String radioName, String selfIntroduction, File image}) async {
    if (image != null) {
      StorageFile postFile;
      final path = '${state.user.documentPath}/${UserKey.userImage.value}';
      postFile =
          await _storage.save(path, image, filename: state.user.radioName);
      final uid = state.user.uid;
      final updateUser = user.User(id: uid)
        ..radioName = radioName
        ..selfIntroduction = selfIntroduction
        ..userImage = postFile;

      await documentAccessorRepository.update(updateUser);
    } else {
      final uid = state.user.uid;
      final updateUser = user.User(id: uid)
        ..radioName = radioName
        ..selfIntroduction = selfIntroduction;

      await documentAccessorRepository.update(updateUser);
    }
  }
}
