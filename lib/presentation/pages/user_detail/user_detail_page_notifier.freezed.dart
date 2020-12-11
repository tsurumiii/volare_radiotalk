// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_detail_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserDetailPageStateTearOff {
  const _$UserDetailPageStateTearOff();

// ignore: unused_element
  _UserDetailPageState call({User user, List<Post> postList = const <Post>[]}) {
    return _UserDetailPageState(
      user: user,
      postList: postList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserDetailPageState = _$UserDetailPageStateTearOff();

/// @nodoc
mixin _$UserDetailPageState {
  User get user;
  List<Post> get postList;

  $UserDetailPageStateCopyWith<UserDetailPageState> get copyWith;
}

/// @nodoc
abstract class $UserDetailPageStateCopyWith<$Res> {
  factory $UserDetailPageStateCopyWith(
          UserDetailPageState value, $Res Function(UserDetailPageState) then) =
      _$UserDetailPageStateCopyWithImpl<$Res>;
  $Res call({User user, List<Post> postList});
}

/// @nodoc
class _$UserDetailPageStateCopyWithImpl<$Res>
    implements $UserDetailPageStateCopyWith<$Res> {
  _$UserDetailPageStateCopyWithImpl(this._value, this._then);

  final UserDetailPageState _value;
  // ignore: unused_field
  final $Res Function(UserDetailPageState) _then;

  @override
  $Res call({
    Object user = freezed,
    Object postList = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed ? _value.user : user as User,
      postList: postList == freezed ? _value.postList : postList as List<Post>,
    ));
  }
}

/// @nodoc
abstract class _$UserDetailPageStateCopyWith<$Res>
    implements $UserDetailPageStateCopyWith<$Res> {
  factory _$UserDetailPageStateCopyWith(_UserDetailPageState value,
          $Res Function(_UserDetailPageState) then) =
      __$UserDetailPageStateCopyWithImpl<$Res>;
  @override
  $Res call({User user, List<Post> postList});
}

/// @nodoc
class __$UserDetailPageStateCopyWithImpl<$Res>
    extends _$UserDetailPageStateCopyWithImpl<$Res>
    implements _$UserDetailPageStateCopyWith<$Res> {
  __$UserDetailPageStateCopyWithImpl(
      _UserDetailPageState _value, $Res Function(_UserDetailPageState) _then)
      : super(_value, (v) => _then(v as _UserDetailPageState));

  @override
  _UserDetailPageState get _value => super._value as _UserDetailPageState;

  @override
  $Res call({
    Object user = freezed,
    Object postList = freezed,
  }) {
    return _then(_UserDetailPageState(
      user: user == freezed ? _value.user : user as User,
      postList: postList == freezed ? _value.postList : postList as List<Post>,
    ));
  }
}

/// @nodoc
class _$_UserDetailPageState implements _UserDetailPageState {
  const _$_UserDetailPageState({this.user, this.postList = const <Post>[]})
      : assert(postList != null);

  @override
  final User user;
  @JsonKey(defaultValue: const <Post>[])
  @override
  final List<Post> postList;

  @override
  String toString() {
    return 'UserDetailPageState(user: $user, postList: $postList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDetailPageState &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.postList, postList) ||
                const DeepCollectionEquality()
                    .equals(other.postList, postList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(postList);

  @override
  _$UserDetailPageStateCopyWith<_UserDetailPageState> get copyWith =>
      __$UserDetailPageStateCopyWithImpl<_UserDetailPageState>(
          this, _$identity);
}

abstract class _UserDetailPageState implements UserDetailPageState {
  const factory _UserDetailPageState({User user, List<Post> postList}) =
      _$_UserDetailPageState;

  @override
  User get user;
  @override
  List<Post> get postList;
  @override
  _$UserDetailPageStateCopyWith<_UserDetailPageState> get copyWith;
}
