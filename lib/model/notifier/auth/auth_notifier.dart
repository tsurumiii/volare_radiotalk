import 'package:firebase_auth/firebase_auth.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/model/notifier/auth/auth_state.dart';
import 'package:volare_radiotalk/model/repository/index.dart';

class AuthNotifier extends StateNotifier<AuthState> with LocatorMixin {
  AuthNotifier({
    @required this.context,
  }) : super(const AuthState(isLoading: false));

  final BuildContext context;

  AuthRepository get authRepository => read<AuthRepository>();
  DocumentAccessorRepository get documentAccessorRepository =>
      read<DocumentAccessorRepository>();

  Future<StartUpType> startUp() async {
    final loginType = await authRepository.autoSignIn();
    if (loginType == LoginType.anonymously) {
      return StartUpType.fistTimeUser;
    } else {
      final currentUser = FirebaseAuth.instance.currentUser;
      logger.fine('userId ${currentUser.uid}');

      // final user = await documentAccessorRepository
      //     .load<job.User>(job.User(id: currentUser.uid));
      if (currentUser != null) {
        return StartUpType.loggedInUser;
      }
      return StartUpType.incompleteUser;
    }
  }
}
