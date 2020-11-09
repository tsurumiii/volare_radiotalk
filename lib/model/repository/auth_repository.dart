import 'package:firebase_auth/firebase_auth.dart';
import 'package:volare_radiotalk/common/index.dart';

abstract class AuthRepository {
  Future<UserCredential> signInWithAnonymously();
  Future<LoginType> autoSignIn();
  Future<void> signUp(String email, String pass);
  Future<String> signIn(String email, String pass);
  Future<void> logOut();
}
