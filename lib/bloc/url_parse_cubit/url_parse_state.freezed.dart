// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url_parse_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UrlParseState {
  Uri get uri => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uri uri) open,
    required TResult Function(Uri uri) requiresValidation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uri uri)? open,
    TResult? Function(Uri uri)? requiresValidation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uri uri)? open,
    TResult Function(Uri uri)? requiresValidation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Open value) open,
    required TResult Function(_RequiresValidation value) requiresValidation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Open value)? open,
    TResult? Function(_RequiresValidation value)? requiresValidation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Open value)? open,
    TResult Function(_RequiresValidation value)? requiresValidation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UrlParseStateCopyWith<UrlParseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlParseStateCopyWith<$Res> {
  factory $UrlParseStateCopyWith(
          UrlParseState value, $Res Function(UrlParseState) then) =
      _$UrlParseStateCopyWithImpl<$Res, UrlParseState>;
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class _$UrlParseStateCopyWithImpl<$Res, $Val extends UrlParseState>
    implements $UrlParseStateCopyWith<$Res> {
  _$UrlParseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_value.copyWith(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpenCopyWith<$Res> implements $UrlParseStateCopyWith<$Res> {
  factory _$$_OpenCopyWith(_$_Open value, $Res Function(_$_Open) then) =
      __$$_OpenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class __$$_OpenCopyWithImpl<$Res>
    extends _$UrlParseStateCopyWithImpl<$Res, _$_Open>
    implements _$$_OpenCopyWith<$Res> {
  __$$_OpenCopyWithImpl(_$_Open _value, $Res Function(_$_Open) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_$_Open(
      null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_Open extends _Open {
  const _$_Open(this.uri) : super._();

  @override
  final Uri uri;

  @override
  String toString() {
    return 'UrlParseState.open(uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Open &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpenCopyWith<_$_Open> get copyWith =>
      __$$_OpenCopyWithImpl<_$_Open>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uri uri) open,
    required TResult Function(Uri uri) requiresValidation,
  }) {
    return open(uri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uri uri)? open,
    TResult? Function(Uri uri)? requiresValidation,
  }) {
    return open?.call(uri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uri uri)? open,
    TResult Function(Uri uri)? requiresValidation,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(uri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Open value) open,
    required TResult Function(_RequiresValidation value) requiresValidation,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Open value)? open,
    TResult? Function(_RequiresValidation value)? requiresValidation,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Open value)? open,
    TResult Function(_RequiresValidation value)? requiresValidation,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class _Open extends UrlParseState {
  const factory _Open(final Uri uri) = _$_Open;
  const _Open._() : super._();

  @override
  Uri get uri;
  @override
  @JsonKey(ignore: true)
  _$$_OpenCopyWith<_$_Open> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RequiresValidationCopyWith<$Res>
    implements $UrlParseStateCopyWith<$Res> {
  factory _$$_RequiresValidationCopyWith(_$_RequiresValidation value,
          $Res Function(_$_RequiresValidation) then) =
      __$$_RequiresValidationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class __$$_RequiresValidationCopyWithImpl<$Res>
    extends _$UrlParseStateCopyWithImpl<$Res, _$_RequiresValidation>
    implements _$$_RequiresValidationCopyWith<$Res> {
  __$$_RequiresValidationCopyWithImpl(
      _$_RequiresValidation _value, $Res Function(_$_RequiresValidation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_$_RequiresValidation(
      null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_RequiresValidation extends _RequiresValidation {
  const _$_RequiresValidation(this.uri) : super._();

  @override
  final Uri uri;

  @override
  String toString() {
    return 'UrlParseState.requiresValidation(uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequiresValidation &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequiresValidationCopyWith<_$_RequiresValidation> get copyWith =>
      __$$_RequiresValidationCopyWithImpl<_$_RequiresValidation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uri uri) open,
    required TResult Function(Uri uri) requiresValidation,
  }) {
    return requiresValidation(uri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uri uri)? open,
    TResult? Function(Uri uri)? requiresValidation,
  }) {
    return requiresValidation?.call(uri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uri uri)? open,
    TResult Function(Uri uri)? requiresValidation,
    required TResult orElse(),
  }) {
    if (requiresValidation != null) {
      return requiresValidation(uri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Open value) open,
    required TResult Function(_RequiresValidation value) requiresValidation,
  }) {
    return requiresValidation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Open value)? open,
    TResult? Function(_RequiresValidation value)? requiresValidation,
  }) {
    return requiresValidation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Open value)? open,
    TResult Function(_RequiresValidation value)? requiresValidation,
    required TResult orElse(),
  }) {
    if (requiresValidation != null) {
      return requiresValidation(this);
    }
    return orElse();
  }
}

abstract class _RequiresValidation extends UrlParseState {
  const factory _RequiresValidation(final Uri uri) = _$_RequiresValidation;
  const _RequiresValidation._() : super._();

  @override
  Uri get uri;
  @override
  @JsonKey(ignore: true)
  _$$_RequiresValidationCopyWith<_$_RequiresValidation> get copyWith =>
      throw _privateConstructorUsedError;
}
