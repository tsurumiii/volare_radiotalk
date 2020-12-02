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
