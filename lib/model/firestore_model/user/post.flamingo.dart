// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum PostKey {
  uid,
  radioName,
  userImage,
  title,
  detail,
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
      case PostKey.userImage:
        return 'userImage';
      case PostKey.title:
        return 'title';
      case PostKey.detail:
        return 'detail';
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
  Helper.writeNotNull(data, 'userImage', doc.userImage);
  Helper.writeNotNull(data, 'title', doc.title);
  Helper.writeNotNull(data, 'detail', doc.detail);
  Helper.writeNotNull(data, 'postImage', doc.postImage);
  Helper.writeNotNull(data, 'post', doc.post);

  return data;
}

/// For load data
void _$fromData(Post doc, Map<String, dynamic> data) {
  doc.uid = Helper.valueFromKey<String>(data, 'uid');
  doc.radioName = Helper.valueFromKey<String>(data, 'radioName');
  doc.userImage = Helper.valueFromKey<StorageFile>(data, 'userImage');
  doc.title = Helper.valueFromKey<String>(data, 'title');
  doc.detail = Helper.valueFromKey<String>(data, 'detail');
  doc.postImage = Helper.valueFromKey<StorageFile>(data, 'postImage');
  doc.post = Helper.valueFromKey<StorageFile>(data, 'post');
}
