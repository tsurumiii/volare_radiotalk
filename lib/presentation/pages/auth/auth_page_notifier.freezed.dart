// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthPageStateTearOff {
  const _$AuthPageStateTearOff();

// ignore: unused_element
  _AuthPageState call(
      {String email = '', String password = '', bool isLogin = true}) {
    return _AuthPageState(
      email: email,
      password: password,
      isLogin: isLogin,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthPageState = _$AuthPageStateTearOff();

/// @nodoc
mixin _$AuthPageState {
  String get email;
  String get password;
  bool get isLogin;

  $AuthPageStateCopyWith<AuthPageState> get copyWith;
}

/// @nodoc
abstract class $AuthPageStateCopyWith<$Res> {
  factory $AuthPageStateCopyWith(
          AuthPageState value, $Res Function(AuthPageState) then) =
      _$AuthPageStateCopyWithImpl<$Res>;
  $Res call({String email, String password, bool isLogin});
}

/// @nodoc
class _$AuthPageStateCopyWithImpl<$Res>
    implements $AuthPageStateCopyWith<$Res> {
  _$AuthPageStateCopyWithImpl(this._value, this._then);

  final AuthPageState _value;
  // ignore: unused_field
  final $Res Function(AuthPageState) _then;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object isLogin = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      isLogin: isLogin == freezed ? _value.isLogin : isLogin as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthPageStateCopyWith<$Res>
    implements $AuthPageStateCopyWith<$Res> {
  factory _$AuthPageStateCopyWith(
          _AuthPageState value, $Res Function(_AuthPageState) then) =
      __$AuthPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password, bool isLogin});
}

/// @nodoc
class __$AuthPageStateCopyWithImpl<$Res>
    extends _$AuthPageStateCopyWithImpl<$Res>
    implements _$AuthPageStateCopyWith<$Res> {
  __$AuthPageStateCopyWithImpl(
      _AuthPageState _value, $Res Function(_AuthPageState) _then)
      : super(_value, (v) => _then(v as _AuthPageState));

  @override
  _AuthPageState get _value => super._value as _AuthPageState;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object isLogin = freezed,
  }) {
    return _then(_AuthPageState(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      isLogin: isLogin == freezed ? _value.isLogin : isLogin as bool,
    ));
  }
}

/// @nodoc
class _$_AuthPageState with DiagnosticableTreeMixin implements _AuthPageState {
  const _$_AuthPageState(
      {this.email = '', this.password = '', this.isLogin = true})
      : assert(email != null),
        assert(password != null),
        assert(isLogin != null);

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String password;
  @JsonKey(defaultValue: true)
  @override
  final bool isLogin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthPageState(email: $email, password: $password, isLogin: $isLogin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthPageState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('isLogin', isLogin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthPageState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.isLogin, isLogin) ||
                const DeepCollectionEquality().equals(other.isLogin, isLogin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(isLogin);

  @override
  _$AuthPageStateCopyWith<_AuthPageState> get copyWith =>
      __$AuthPageStateCopyWithImpl<_AuthPageState>(this, _$identity);
}

abstract class _AuthPageState implements AuthPageState {
  const factory _AuthPageState({String email, String password, bool isLogin}) =
      _$_AuthPageState;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get isLogin;
  @override
  _$AuthPageStateCopyWith<_AuthPageState> get copyWith;
}
