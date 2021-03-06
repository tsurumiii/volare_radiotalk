import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import 'base.dart';
import 'post.dart';

part 'user.flamingo.dart';

class User extends Base<User> {
  User({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(id: id, snapshot: snapshot, values: values) {
    posts = Collection<Post>(this, UserKey.posts.value);
  }

  @override
  CollectionReference get collectionRootReference =>
      super.collectionRootReference.doc('v1').collection('users');

  // uid
  @Field()
  String uid;

  // email
  @Field()
  String email;

  // ラジオネーム
  @Field()
  String radioName;

  // プロフィール写真
  @StorageField()
  StorageFile userImage;

  // 自己紹介
  @Field()
  String selfIntroduction;

  // post
  @SubCollection()
  Collection<Post> posts;

  @override
  Map<String, dynamic> toData() => <String, dynamic>{
        ...super.toData(),
        ..._$toData(this),
      };

  @override
  void fromData(Map<String, dynamic> data) {
    super.fromData(data);
    _$fromData(this, data);
  }
}
