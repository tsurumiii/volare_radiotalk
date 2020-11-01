import 'package:firebase_auth/firebase_auth.dart';
import 'package:volare_radiotalk/common/index.dart';

abstract class AuthRepository {
  Future<UserCredential> signInWithAnonymously();
  Future<LoginType> autoSignIn();
}
