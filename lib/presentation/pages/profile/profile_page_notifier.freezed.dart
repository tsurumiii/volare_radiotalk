// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'profile_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProfilePageStateTearOff {
  const _$ProfilePageStateTearOff();

// ignore: unused_element
  _ProfilePageState call(
      {File image,
      bool isImageUrl = false,
      String radioName = '',
      String selfIntroduction = '',
      bool isLoading = true}) {
    return _ProfilePageState(
      image: image,
      isImageUrl: isImageUrl,
      radioName: radioName,
      selfIntroduction: selfIntroduction,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProfilePageState = _$ProfilePageStateTearOff();

/// @nodoc
mixin _$ProfilePageState {
  File get image;
  bool get isImageUrl;
  String get radioName;
  String get selfIntroduction;
  bool get isLoading;

  $ProfilePageStateCopyWith<ProfilePageState> get copyWith;
}

/// @nodoc
abstract class $ProfilePageStateCopyWith<$Res> {
  factory $ProfilePageStateCopyWith(
          ProfilePageState value, $Res Function(ProfilePageState) then) =
      _$ProfilePageStateCopyWithImpl<$Res>;
  $Res call(
      {File image,
      bool isImageUrl,
      String radioName,
      String selfIntroduction,
      bool isLoading});
}

/// @nodoc
class _$ProfilePageStateCopyWithImpl<$Res>
    implements $ProfilePageStateCopyWith<$Res> {
  _$ProfilePageStateCopyWithImpl(this._value, this._then);

  final ProfilePageState _value;
  // ignore: unused_field
  final $Res Function(ProfilePageState) _then;

  @override
  $Res call({
    Object image = freezed,
    Object isImageUrl = freezed,
    Object radioName = freezed,
    Object selfIntroduction = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed ? _value.image : image as File,
      isImageUrl:
          isImageUrl == freezed ? _value.isImageUrl : isImageUrl as bool,
      radioName: radioName == freezed ? _value.radioName : radioName as String,
      selfIntroduction: selfIntroduction == freezed
          ? _value.selfIntroduction
          : selfIntroduction as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProfilePageStateCopyWith<$Res>
    implements $ProfilePageStateCopyWith<$Res> {
  factory _$ProfilePageStateCopyWith(
          _ProfilePageState value, $Res Function(_ProfilePageState) then) =
      __$ProfilePageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {File image,
      bool isImageUrl,
      String radioName,
      String selfIntroduction,
      bool isLoading});
}

/// @nodoc
class __$ProfilePageStateCopyWithImpl<$Res>
    extends _$ProfilePageStateCopyWithImpl<$Res>
    implements _$ProfilePageStateCopyWith<$Res> {
  __$ProfilePageStateCopyWithImpl(
      _ProfilePageState _value, $Res Function(_ProfilePageState) _then)
      : super(_value, (v) => _then(v as _ProfilePageState));

  @override
  _ProfilePageState get _value => super._value as _ProfilePageState;

  @override
  $Res call({
    Object image = freezed,
    Object isImageUrl = freezed,
    Object radioName = freezed,
    Object selfIntroduction = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_ProfilePageState(
      image: image == freezed ? _value.image : image as File,
      isImageUrl:
          isImageUrl == freezed ? _value.isImageUrl : isImageUrl as bool,
      radioName: radioName == freezed ? _value.radioName : radioName as String,
      selfIntroduction: selfIntroduction == freezed
          ? _value.selfIntroduction
          : selfIntroduction as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
class _$_ProfilePageState implements _ProfilePageState {
  const _$_ProfilePageState(
      {this.image,
      this.isImageUrl = false,
      this.radioName = '',
      this.selfIntroduction = '',
      this.isLoading = true})
      : assert(isImageUrl != null),
        assert(radioName != null),
        assert(selfIntroduction != null),
        assert(isLoading != null);

  @override
  final File image;
  @JsonKey(defaultValue: false)
  @override
  final bool isImageUrl;
  @JsonKey(defaultValue: '')
  @override
  final String radioName;
  @JsonKey(defaultValue: '')
  @override
  final String selfIntroduction;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ProfilePageState(image: $image, isImageUrl: $isImageUrl, radioName: $radioName, selfIntroduction: $selfIntroduction, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilePageState &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.isImageUrl, isImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.isImageUrl, isImageUrl)) &&
            (identical(other.radioName, radioName) ||
                const DeepCollectionEquality()
                    .equals(other.radioName, radioName)) &&
            (identical(other.selfIntroduction, selfIntroduction) ||
                const DeepCollectionEquality()
                    .equals(other.selfIntroduction, selfIntroduction)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(isImageUrl) ^
      const DeepCollectionEquality().hash(radioName) ^
      const DeepCollectionEquality().hash(selfIntroduction) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$ProfilePageStateCopyWith<_ProfilePageState> get copyWith =>
      __$ProfilePageStateCopyWithImpl<_ProfilePageState>(this, _$identity);
}

abstract class _ProfilePageState implements ProfilePageState {
  const factory _ProfilePageState(
      {File image,
      bool isImageUrl,
      String radioName,
      String selfIntroduction,
      bool isLoading}) = _$_ProfilePageState;

  @override
  File get image;
  @override
  bool get isImageUrl;
  @override
  String get radioName;
  @override
  String get selfIntroduction;
  @override
  bool get isLoading;
  @override
  _$ProfilePageStateCopyWith<_ProfilePageState> get copyWith;
}
