// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum UserKey {
  uid,
  email,
  radioName,
  selfIntroduction,

  userImage,
  posts,
}

extension UserKeyExtension on UserKey {
  String get value {
    switch (this) {
      case UserKey.uid:
        return 'uid';
      case UserKey.email:
        return 'email';
      case UserKey.radioName:
        return 'radioName';
      case UserKey.selfIntroduction:
        return 'selfIntroduction';
      case UserKey.userImage:
        return 'userImage';
      case UserKey.posts:
        return 'posts';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(User doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'uid', doc.uid);
  Helper.writeNotNull(data, 'email', doc.email);
  Helper.writeNotNull(data, 'radioName', doc.radioName);
  Helper.writeNotNull(data, 'selfIntroduction', doc.selfIntroduction);

  Helper.writeStorageNotNull(data, 'userImage', doc.userImage, isSetNull: true);

  return data;
}

/// For load data
void _$fromData(User doc, Map<String, dynamic> data) {
  doc.uid = Helper.valueFromKey<String>(data, 'uid');
  doc.email = Helper.valueFromKey<String>(data, 'email');
  doc.radioName = Helper.valueFromKey<String>(data, 'radioName');
  doc.selfIntroduction = Helper.valueFromKey<String>(data, 'selfIntroduction');

  doc.userImage = Helper.storageFile(data, 'userImage');
}
