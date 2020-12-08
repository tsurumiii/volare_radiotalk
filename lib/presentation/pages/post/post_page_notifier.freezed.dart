// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'post_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PostPageStateTearOff {
  const _$PostPageStateTearOff();

// ignore: unused_element
  _PostPageState call({File postImage, String title = '', String detail = ''}) {
    return _PostPageState(
      postImage: postImage,
      title: title,
      detail: detail,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PostPageState = _$PostPageStateTearOff();

/// @nodoc
mixin _$PostPageState {
  File get postImage;
  String get title;
  String get detail;

  $PostPageStateCopyWith<PostPageState> get copyWith;
}

/// @nodoc
abstract class $PostPageStateCopyWith<$Res> {
  factory $PostPageStateCopyWith(
          PostPageState value, $Res Function(PostPageState) then) =
      _$PostPageStateCopyWithImpl<$Res>;
  $Res call({File postImage, String title, String detail});
}

/// @nodoc
class _$PostPageStateCopyWithImpl<$Res>
    implements $PostPageStateCopyWith<$Res> {
  _$PostPageStateCopyWithImpl(this._value, this._then);

  final PostPageState _value;
  // ignore: unused_field
  final $Res Function(PostPageState) _then;

  @override
  $Res call({
    Object postImage = freezed,
    Object title = freezed,
    Object detail = freezed,
  }) {
    return _then(_value.copyWith(
      postImage: postImage == freezed ? _value.postImage : postImage as File,
      title: title == freezed ? _value.title : title as String,
      detail: detail == freezed ? _value.detail : detail as String,
    ));
  }
}

/// @nodoc
abstract class _$PostPageStateCopyWith<$Res>
    implements $PostPageStateCopyWith<$Res> {
  factory _$PostPageStateCopyWith(
          _PostPageState value, $Res Function(_PostPageState) then) =
      __$PostPageStateCopyWithImpl<$Res>;
  @override
  $Res call({File postImage, String title, String detail});
}

/// @nodoc
class __$PostPageStateCopyWithImpl<$Res>
    extends _$PostPageStateCopyWithImpl<$Res>
    implements _$PostPageStateCopyWith<$Res> {
  __$PostPageStateCopyWithImpl(
      _PostPageState _value, $Res Function(_PostPageState) _then)
      : super(_value, (v) => _then(v as _PostPageState));

  @override
  _PostPageState get _value => super._value as _PostPageState;

  @override
  $Res call({
    Object postImage = freezed,
    Object title = freezed,
    Object detail = freezed,
  }) {
    return _then(_PostPageState(
      postImage: postImage == freezed ? _value.postImage : postImage as File,
      title: title == freezed ? _value.title : title as String,
      detail: detail == freezed ? _value.detail : detail as String,
    ));
  }
}

/// @nodoc
class _$_PostPageState with DiagnosticableTreeMixin implements _PostPageState {
  const _$_PostPageState({this.postImage, this.title = '', this.detail = ''})
      : assert(title != null),
        assert(detail != null);

  @override
  final File postImage;
  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String detail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostPageState(postImage: $postImage, title: $title, detail: $detail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostPageState'))
      ..add(DiagnosticsProperty('postImage', postImage))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('detail', detail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostPageState &&
            (identical(other.postImage, postImage) ||
                const DeepCollectionEquality()
                    .equals(other.postImage, postImage)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(postImage) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(detail);

  @override
  _$PostPageStateCopyWith<_PostPageState> get copyWith =>
      __$PostPageStateCopyWithImpl<_PostPageState>(this, _$identity);
}

abstract class _PostPageState implements PostPageState {
  const factory _PostPageState({File postImage, String title, String detail}) =
      _$_PostPageState;

  @override
  File get postImage;
  @override
  String get title;
  @override
  String get detail;
  @override
  _$PostPageStateCopyWith<_PostPageState> get copyWith;
}
