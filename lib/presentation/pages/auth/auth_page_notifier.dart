import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/model/notifier/index.dart';
import 'package:volare_radiotalk/presentation/pages/index.dart';

part 'auth_page_notifier.freezed.dart';

@freezed
abstract class AuthPageState with _$AuthPageState {
  const factory AuthPageState({
    @Default('') String email,
    @Default('') String password,
    @Default(true) bool isLogin,
  }) = _AuthPageState;
}

class AuthPageNotifier extends StateNotifier<AuthPageState> with LocatorMixin {
  AuthPageNotifier({@required this.context}) : super(const AuthPageState());

  final BuildContext context;

  AuthNotifier get authNotifier => read<AuthNotifier>();
  UserNotifier get userNotifier => read<UserNotifier>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  void onChangeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void onChangePassword(String password) {
    state = state.copyWith(password: password);
  }

  void onChangeIsLoginPage() {
    state = state.copyWith(isLogin: !state.isLogin);
  }

  Future<void> sendFunction() async {
    print('called sendFunction');
    if (state.email.isEmpty || state.password.isEmpty) {
      return;
    }
    if (state.isLogin) {
      final res = await authNotifier.signIn(state.email, state.password);
      if (res == 'OK') {
        final user = authNotifier.currentUser();
        await userNotifier.fetchUser(user.uid);
        await Navigator.of(context, rootNavigator: true).push<void>(
          CupertinoPageRoute(builder: (_) => AppPage.wrapped()),
        );
      } else if (res == 'user-not-found') {
        print('登録されてない');
      } else if (res == 'invalid-emai') {
        print('形式が違う');
      }
    } else {
      final res = await authNotifier.singUp(state.email, state.password);
      await userNotifier.createUser(res);
      await userNotifier.fetchUser(res.user.uid);
      await Navigator.of(context, rootNavigator: true).push<void>(
        CupertinoPageRoute(builder: (_) => AppPage.wrapped()),
      );
    }
  }
}
