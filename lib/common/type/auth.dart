import '../constants/constants.dart';

/// LoginType
enum LoginType {
  invalid,
  email,
  phoneNumber,
  apple,
  facebook,
  twitter,
  google,
  anonymously,
  unknown
}

extension LoginTypeExtension on LoginType {
  int get rawValue {
    switch (this) {
      case LoginType.invalid:
        return loginTypeInvalid;
      case LoginType.email:
        return loginTypeEmail;
      case LoginType.phoneNumber:
        return loginTypePhoneNumber;
      case LoginType.apple:
        return loginTypeApple;
      case LoginType.facebook:
        return loginTypeFacebook;
      case LoginType.twitter:
        return loginTypeTwitter;
      case LoginType.google:
        return loginTypeGoogle;
      case LoginType.anonymously:
        return loginTypeAnonymously;
      case LoginType.unknown:
        return loginTypeUnknown;
    }
    return -1;
  }
}
