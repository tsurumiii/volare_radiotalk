import 'package:flutter/services.dart';

class AppException implements Exception {
  AppException({
    this.code,
    this.message,
    this.details,
  });

  final String code;
  final String message;
  final dynamic details;

  @override
  String toString() => 'AppException($code, $message, $details)';
}

class ImoryApiException implements Exception {
  ImoryApiException({
    this.code,
    this.message,
    this.details,
  });

  factory ImoryApiException.fromPlatformException(PlatformException e) {
    final dynamic details = e.details;
    return ImoryApiException(
      code: details['code'] as dynamic,
      message: details['message'] as String,
      details: details['details'] as dynamic,
    );
  }

  final dynamic code;
  final String message;
  final dynamic details;

  @override
  String toString() => 'AppException($code, $message, $details)';
}
