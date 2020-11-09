import 'package:firebase_auth/firebase_auth.dart';
import 'package:volare_radiotalk/common/index.dart';
import 'package:volare_radiotalk/common/type/auth.dart';

import '../index.dart';

class AuthDataSource implements AuthRepository {
  AuthDataSource({
    FirebaseAuth auth,
  }) {
    _auth = auth != null ? auth : FirebaseAuth.instance;
  }

  FirebaseAuth _auth;
  @override
  Future<LoginType> autoSignIn() async {
    final currentUser = _auth.currentUser;
    print(currentUser);
    if (currentUser != null) {
      return _loginType(currentUser);
    } else {
      return LoginType.anonymously;
    }
  }

  @override
  Future<UserCredential> signInWithAnonymously() => _auth.signInAnonymously();

  @override
  Future<void> signUp(String email, String pass) async {
    final res = await _auth.createUserWithEmailAndPassword(
        email: email, password: pass);
    print(res);
  }

  @override
  Future<String> signIn(String email, String pass) async {
    try {
      final res =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      print(res);
      return 'OK';
    } on FirebaseException catch (e) {
      print(e.code);
      return e.code;
    }
  }

  LoginType _loginType(User user) {
    if (user?.providerData == null) {
      return LoginType.invalid;
    }
    print(
        'uid: ${user.uid} isAnonymous: ${user.isAnonymous} ${user.displayName}');
    var loginType = LoginType.unknown;
    if (user.isAnonymous) {
      loginType = LoginType.anonymously;
    }
    if (user.providerData.isNotEmpty) {
      for (var data in user.providerData) {
        if (data.providerId != 'firebase') {
          if (data.email != null && data.providerId == 'password') {
            loginType = LoginType.email;
            break;
          }
          if (data.email != null && data.providerId == 'google.com') {
            loginType = LoginType.google;
            break;
          }
          if (data.providerId == 'twitter.com') {
            loginType = LoginType.twitter;
            break;
          }
          if (data.providerId == 'facebook.com') {
            loginType = LoginType.facebook;
            break;
          }
          if (data.providerId == 'apple.com') {
            loginType = LoginType.apple;
            break;
          }
          if (data.phoneNumber != null) {
            loginType = LoginType.phoneNumber;
            break;
          }
        }
      }
    }
    return loginType;
  }

  @override
  Future<void> logOut() async {
    await _auth.signOut();
  }
}
