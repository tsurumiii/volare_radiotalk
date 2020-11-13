import 'package:firebase_auth/firebase_auth.dart';
import 'package:flamingo/flamingo.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/firestore_model/user/index.dart' as user;
import 'package:volare_radiotalk/model/notifier/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> with LocatorMixin {
  UserNotifier() : super(const UserState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }

  DocumentAccessorRepository get documentAccessorRepository =>
      read<DocumentAccessorRepository>();

  void _configure() {}

  Future<void> createUser(UserCredential userCredential) async {
    final newUser = user.User(id: userCredential.user.uid)
      ..uid = userCredential.user.uid
      ..email = userCredential.user.email
      ..radioName = ''
      ..userImage = null;
    await documentAccessorRepository.save(newUser);
  }

  Future<void> fetchUser(String uid) async {
    final data =
        await documentAccessorRepository.load<user.User>(user.User(id: uid));
    state = state.copyWith(user: data);
  }
}
