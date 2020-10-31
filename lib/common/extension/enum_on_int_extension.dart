//import 'package:imory/domain/type/types.dart';
//import 'package:imory/domain/type/script_sentence_type.dart';
//import 'package:imory/domain/type/language.dart';
//
///// Extension on int
//extension EnumTypeExtension on int {
//  /// LoginType
//  LoginType get toLoginType {
//    switch (this) {
//      case loginTypeInvalid:
//        return LoginType.invalid;
//      case loginTypeEmail:
//        return LoginType.email;
//      case loginTypePhoneNumber:
//        return LoginType.phoneNumber;
//      case loginTypeApple:
//        return LoginType.apple;
//      case loginTypeFacebook:
//        return LoginType.facebook;
//      case loginTypeTwitter:
//        return LoginType.twitter;
//      case loginTypeGoogle:
//        return LoginType.google;
//      case loginTypeAnonymously:
//        return LoginType.anonymously;
//      case loginTypeUnknown:
//        return LoginType.unknown;
//      default:
//        return null;
//    }
//  }
//
//  /// DownloadStudyScriptStatus
//  DownloadStudyScriptStatus get toDownloadStudyScriptStatus {
//    switch (this) {
//      case downloadStudyScriptStatusInvalid:
//        return DownloadStudyScriptStatus.invalid;
//      case downloadStudyScriptStatusSuccess:
//        return DownloadStudyScriptStatus.success;
//      case downloadStudyScriptStatusNotEnough:
//        return DownloadStudyScriptStatus.notEnough;
//      default:
//        return null;
//    }
//  }
//  /// ActiveType
//  ActiveType get toActiveType {
//    switch (this) {
//      case activeTypeRunning:
//        return ActiveType.running;
//      case activeTypeStop:
//        return ActiveType.stop;
//      case activeTypeLeave:
//        return ActiveType.leave;
//      default:
//        return null;
//    }
//  }
//  UnderstandingLevelType get toUnderstandingLevelType {
//    switch (this) {
//      case understandingLevelPerfect:
//        return UnderstandingLevelType.perfect;
//      case understandingLevelBad:
//        return UnderstandingLevelType.bad;
//      default:
//        return null;
//    }
//  }
//
//  ScriptSentenceType get toScriptSentenceType {
//    switch (this) {
//      case scriptSentenceTypeWord:
//        return ScriptSentenceType.word;
//      case scriptSentenceTypeSentence:
//        return ScriptSentenceType.sentence;
//      default:
//        return null;
//    }
//  }
//
//  Language get toLanguageType {
//    switch (this) {
//      case languageEnglish:
//        return Language.english;
//      case languageJapanese:
//        return Language.japanese;
//    }
//    return null;
//  }
//}