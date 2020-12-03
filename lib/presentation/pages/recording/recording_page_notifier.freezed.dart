// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'recording_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RecordingPageStateTearOff {
  const _$RecordingPageStateTearOff();

// ignore: unused_element
  _RecordingPageState call(
      {bool isLoading = false,
      bool isRedording = false,
      bool mPlayerIsInited = false,
      bool mRecorderIsInited = false,
      bool mplaybackReady = false,
      String mPath = ''}) {
    return _RecordingPageState(
      isLoading: isLoading,
      isRedording: isRedording,
      mPlayerIsInited: mPlayerIsInited,
      mRecorderIsInited: mRecorderIsInited,
      mplaybackReady: mplaybackReady,
      mPath: mPath,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RecordingPageState = _$RecordingPageStateTearOff();

/// @nodoc
mixin _$RecordingPageState {
  bool get isLoading;
  bool get isRedording;
  bool get mPlayerIsInited;
  bool get mRecorderIsInited;
  bool get mplaybackReady;
  String get mPath;

  $RecordingPageStateCopyWith<RecordingPageState> get copyWith;
}

/// @nodoc
abstract class $RecordingPageStateCopyWith<$Res> {
  factory $RecordingPageStateCopyWith(
          RecordingPageState value, $Res Function(RecordingPageState) then) =
      _$RecordingPageStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isRedording,
      bool mPlayerIsInited,
      bool mRecorderIsInited,
      bool mplaybackReady,
      String mPath});
}

/// @nodoc
class _$RecordingPageStateCopyWithImpl<$Res>
    implements $RecordingPageStateCopyWith<$Res> {
  _$RecordingPageStateCopyWithImpl(this._value, this._then);

  final RecordingPageState _value;
  // ignore: unused_field
  final $Res Function(RecordingPageState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object isRedording = freezed,
    Object mPlayerIsInited = freezed,
    Object mRecorderIsInited = freezed,
    Object mplaybackReady = freezed,
    Object mPath = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isRedording:
          isRedording == freezed ? _value.isRedording : isRedording as bool,
      mPlayerIsInited: mPlayerIsInited == freezed
          ? _value.mPlayerIsInited
          : mPlayerIsInited as bool,
      mRecorderIsInited: mRecorderIsInited == freezed
          ? _value.mRecorderIsInited
          : mRecorderIsInited as bool,
      mplaybackReady: mplaybackReady == freezed
          ? _value.mplaybackReady
          : mplaybackReady as bool,
      mPath: mPath == freezed ? _value.mPath : mPath as String,
    ));
  }
}

/// @nodoc
abstract class _$RecordingPageStateCopyWith<$Res>
    implements $RecordingPageStateCopyWith<$Res> {
  factory _$RecordingPageStateCopyWith(
          _RecordingPageState value, $Res Function(_RecordingPageState) then) =
      __$RecordingPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isRedording,
      bool mPlayerIsInited,
      bool mRecorderIsInited,
      bool mplaybackReady,
      String mPath});
}

/// @nodoc
class __$RecordingPageStateCopyWithImpl<$Res>
    extends _$RecordingPageStateCopyWithImpl<$Res>
    implements _$RecordingPageStateCopyWith<$Res> {
  __$RecordingPageStateCopyWithImpl(
      _RecordingPageState _value, $Res Function(_RecordingPageState) _then)
      : super(_value, (v) => _then(v as _RecordingPageState));

  @override
  _RecordingPageState get _value => super._value as _RecordingPageState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object isRedording = freezed,
    Object mPlayerIsInited = freezed,
    Object mRecorderIsInited = freezed,
    Object mplaybackReady = freezed,
    Object mPath = freezed,
  }) {
    return _then(_RecordingPageState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isRedording:
          isRedording == freezed ? _value.isRedording : isRedording as bool,
      mPlayerIsInited: mPlayerIsInited == freezed
          ? _value.mPlayerIsInited
          : mPlayerIsInited as bool,
      mRecorderIsInited: mRecorderIsInited == freezed
          ? _value.mRecorderIsInited
          : mRecorderIsInited as bool,
      mplaybackReady: mplaybackReady == freezed
          ? _value.mplaybackReady
          : mplaybackReady as bool,
      mPath: mPath == freezed ? _value.mPath : mPath as String,
    ));
  }
}

/// @nodoc
class _$_RecordingPageState
    with DiagnosticableTreeMixin
    implements _RecordingPageState {
  const _$_RecordingPageState(
      {this.isLoading = false,
      this.isRedording = false,
      this.mPlayerIsInited = false,
      this.mRecorderIsInited = false,
      this.mplaybackReady = false,
      this.mPath = ''})
      : assert(isLoading != null),
        assert(isRedording != null),
        assert(mPlayerIsInited != null),
        assert(mRecorderIsInited != null),
        assert(mplaybackReady != null),
        assert(mPath != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isRedording;
  @JsonKey(defaultValue: false)
  @override
  final bool mPlayerIsInited;
  @JsonKey(defaultValue: false)
  @override
  final bool mRecorderIsInited;
  @JsonKey(defaultValue: false)
  @override
  final bool mplaybackReady;
  @JsonKey(defaultValue: '')
  @override
  final String mPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecordingPageState(isLoading: $isLoading, isRedording: $isRedording, mPlayerIsInited: $mPlayerIsInited, mRecorderIsInited: $mRecorderIsInited, mplaybackReady: $mplaybackReady, mPath: $mPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecordingPageState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isRedording', isRedording))
      ..add(DiagnosticsProperty('mPlayerIsInited', mPlayerIsInited))
      ..add(DiagnosticsProperty('mRecorderIsInited', mRecorderIsInited))
      ..add(DiagnosticsProperty('mplaybackReady', mplaybackReady))
      ..add(DiagnosticsProperty('mPath', mPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecordingPageState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isRedording, isRedording) ||
                const DeepCollectionEquality()
                    .equals(other.isRedording, isRedording)) &&
            (identical(other.mPlayerIsInited, mPlayerIsInited) ||
                const DeepCollectionEquality()
                    .equals(other.mPlayerIsInited, mPlayerIsInited)) &&
            (identical(other.mRecorderIsInited, mRecorderIsInited) ||
                const DeepCollectionEquality()
                    .equals(other.mRecorderIsInited, mRecorderIsInited)) &&
            (identical(other.mplaybackReady, mplaybackReady) ||
                const DeepCollectionEquality()
                    .equals(other.mplaybackReady, mplaybackReady)) &&
            (identical(other.mPath, mPath) ||
                const DeepCollectionEquality().equals(other.mPath, mPath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isRedording) ^
      const DeepCollectionEquality().hash(mPlayerIsInited) ^
      const DeepCollectionEquality().hash(mRecorderIsInited) ^
      const DeepCollectionEquality().hash(mplaybackReady) ^
      const DeepCollectionEquality().hash(mPath);

  @override
  _$RecordingPageStateCopyWith<_RecordingPageState> get copyWith =>
      __$RecordingPageStateCopyWithImpl<_RecordingPageState>(this, _$identity);
}

abstract class _RecordingPageState implements RecordingPageState {
  const factory _RecordingPageState(
      {bool isLoading,
      bool isRedording,
      bool mPlayerIsInited,
      bool mRecorderIsInited,
      bool mplaybackReady,
      String mPath}) = _$_RecordingPageState;

  @override
  bool get isLoading;
  @override
  bool get isRedording;
  @override
  bool get mPlayerIsInited;
  @override
  bool get mRecorderIsInited;
  @override
  bool get mplaybackReady;
  @override
  String get mPath;
  @override
  _$RecordingPageStateCopyWith<_RecordingPageState> get copyWith;
}
