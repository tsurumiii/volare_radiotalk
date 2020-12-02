import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';
import 'base.dart';

part 'post.flamingo.dart';

class Post extends Base<Post> {
  Post({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  CollectionReference get collectionRootReference =>
      super.collectionRootReference.doc('v1').collection('post');

  // uid
  @Field()
  String uid;

  // radioName
  @Field()
  String radioName;

  // userImage
  @Field()
  StorageFile userImage;

  // title
  @Field()
  String title;

  // postImage
  @Field()
  StorageFile postImage;

  // post
  @Field()
  StorageFile post;

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
