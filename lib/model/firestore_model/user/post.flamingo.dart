// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum PostKey {
  uid,
  radioName,
  title,
  detail,

  userImage,
  postImage,
  post,
}

extension PostKeyExtension on PostKey {
  String get value {
    switch (this) {
      case PostKey.uid:
        return 'uid';
      case PostKey.radioName:
        return 'radioName';
      case PostKey.title:
        return 'title';
      case PostKey.detail:
        return 'detail';
      case PostKey.userImage:
        return 'userImage';
      case PostKey.postImage:
        return 'postImage';
      case PostKey.post:
        return 'post';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Post doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'uid', doc.uid);
  Helper.writeNotNull(data, 'radioName', doc.radioName);
  Helper.writeNotNull(data, 'title', doc.title);
  Helper.writeNotNull(data, 'detail', doc.detail);

  Helper.writeStorageNotNull(data, 'userImage', doc.userImage, isSetNull: true);
  Helper.writeStorageNotNull(data, 'postImage', doc.postImage, isSetNull: true);
  Helper.writeStorageNotNull(data, 'post', doc.post, isSetNull: true);

  return data;
}

/// For load data
void _$fromData(Post doc, Map<String, dynamic> data) {
  doc.uid = Helper.valueFromKey<String>(data, 'uid');
  doc.radioName = Helper.valueFromKey<String>(data, 'radioName');
  doc.title = Helper.valueFromKey<String>(data, 'title');
  doc.detail = Helper.valueFromKey<String>(data, 'detail');

  doc.userImage = Helper.storageFile(data, 'userImage');
  doc.postImage = Helper.storageFile(data, 'postImage');
  doc.post = Helper.storageFile(data, 'post');
}
