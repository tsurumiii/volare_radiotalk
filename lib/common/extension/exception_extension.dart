import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:volare_radiotalk/common/exception/exception.dart';

extension ExceptionExtension on Exception {
  String get errorMessage {
    final e = this;
    if (e is PlatformException) {
      return e.message;
    }
    if (e is FirebaseAuthException) {
      return e.message;
    }
    if (e is AppException) {
      return e.message;
    }
    if (e is ImoryApiException) {
      return e.message;
    }
    return toString();
  }
}
