// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PostStateTearOff {
  const _$PostStateTearOff();

// ignore: unused_element
  _PostState call({List<Post> postList = const <Post>[]}) {
    return _PostState(
      postList: postList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PostState = _$PostStateTearOff();

/// @nodoc
mixin _$PostState {
  List<Post> get postList;

  $PostStateCopyWith<PostState> get copyWith;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res>;
  $Res call({List<Post> postList});
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res> implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  final PostState _value;
  // ignore: unused_field
  final $Res Function(PostState) _then;

  @override
  $Res call({
    Object postList = freezed,
  }) {
    return _then(_value.copyWith(
      postList: postList == freezed ? _value.postList : postList as List<Post>,
    ));
  }
}

/// @nodoc
abstract class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(
          _PostState value, $Res Function(_PostState) then) =
      __$PostStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Post> postList});
}

/// @nodoc
class __$PostStateCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(_PostState _value, $Res Function(_PostState) _then)
      : super(_value, (v) => _then(v as _PostState));

  @override
  _PostState get _value => super._value as _PostState;

  @override
  $Res call({
    Object postList = freezed,
  }) {
    return _then(_PostState(
      postList: postList == freezed ? _value.postList : postList as List<Post>,
    ));
  }
}

/// @nodoc
class _$_PostState with DiagnosticableTreeMixin implements _PostState {
  const _$_PostState({this.postList = const <Post>[]})
      : assert(postList != null);

  @JsonKey(defaultValue: const <Post>[])
  @override
  final List<Post> postList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostState(postList: $postList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostState'))
      ..add(DiagnosticsProperty('postList', postList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostState &&
            (identical(other.postList, postList) ||
                const DeepCollectionEquality()
                    .equals(other.postList, postList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(postList);

  @override
  _$PostStateCopyWith<_PostState> get copyWith =>
      __$PostStateCopyWithImpl<_PostState>(this, _$identity);
}

abstract class _PostState implements PostState {
  const factory _PostState({List<Post> postList}) = _$_PostState;

  @override
  List<Post> get postList;
  @override
  _$PostStateCopyWith<_PostState> get copyWith;
}
