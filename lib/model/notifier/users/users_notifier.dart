import 'package:flamingo/flamingo.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/firestore_model/user/index.dart';
import 'package:volare_radiotalk/model/notifier/users/users_state.dart';

class UsersNotifier extends StateNotifier<UsersState> with LocatorMixin {
  UsersNotifier() : super(const UsersState()) {
    Future<void>.delayed(Duration.zero, _configure);
  }
  void _configure() {
    fetch();
  }

  Future<void> fetch() async {
    final data = await firestoreInstance.collectionGroup('users').get();
    final userList = data.docs.map((e) => User(snapshot: e)).toList();
    state = state.copyWith(userList: userList);
  }
}
