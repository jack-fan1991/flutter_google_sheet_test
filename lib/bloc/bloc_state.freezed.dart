// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlocState<T, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(E e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(E e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T, E> value) loading,
    required TResult Function(Loaded<T, E> value) loaded,
    required TResult Function(Error<T, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T, E> value)? loading,
    TResult? Function(Loaded<T, E> value)? loaded,
    TResult? Function(Error<T, E> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T, E> value)? loading,
    TResult Function(Loaded<T, E> value)? loaded,
    TResult Function(Error<T, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlocStateCopyWith<T, E, $Res> {
  factory $BlocStateCopyWith(
          BlocState<T, E> value, $Res Function(BlocState<T, E>) then) =
      _$BlocStateCopyWithImpl<T, E, $Res, BlocState<T, E>>;
}

/// @nodoc
class _$BlocStateCopyWithImpl<T, E, $Res, $Val extends BlocState<T, E>>
    implements $BlocStateCopyWith<T, E, $Res> {
  _$BlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, E, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T, E> value, $Res Function(_$Loading<T, E>) then) =
      __$$LoadingCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, E, $Res>
    extends _$BlocStateCopyWithImpl<T, E, $Res, _$Loading<T, E>>
    implements _$$LoadingCopyWith<T, E, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T, E> _value, $Res Function(_$Loading<T, E>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading<T, E> implements Loading<T, E> {
  const _$Loading();

  @override
  String toString() {
    return 'BlocState<$T, $E>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(E e) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(E e)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E e)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T, E> value) loading,
    required TResult Function(Loaded<T, E> value) loaded,
    required TResult Function(Error<T, E> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T, E> value)? loading,
    TResult? Function(Loaded<T, E> value)? loaded,
    TResult? Function(Error<T, E> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T, E> value)? loading,
    TResult Function(Loaded<T, E> value)? loaded,
    TResult Function(Error<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T, E> implements BlocState<T, E> {
  const factory Loading() = _$Loading<T, E>;
}

/// @nodoc
abstract class _$$LoadedCopyWith<T, E, $Res> {
  factory _$$LoadedCopyWith(
          _$Loaded<T, E> value, $Res Function(_$Loaded<T, E>) then) =
      __$$LoadedCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$LoadedCopyWithImpl<T, E, $Res>
    extends _$BlocStateCopyWithImpl<T, E, $Res, _$Loaded<T, E>>
    implements _$$LoadedCopyWith<T, E, $Res> {
  __$$LoadedCopyWithImpl(
      _$Loaded<T, E> _value, $Res Function(_$Loaded<T, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Loaded<T, E>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Loaded<T, E> implements Loaded<T, E> {
  const _$Loaded(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'BlocState<$T, $E>.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded<T, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedCopyWith<T, E, _$Loaded<T, E>> get copyWith =>
      __$$LoadedCopyWithImpl<T, E, _$Loaded<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(E e) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(E e)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E e)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T, E> value) loading,
    required TResult Function(Loaded<T, E> value) loaded,
    required TResult Function(Error<T, E> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T, E> value)? loading,
    TResult? Function(Loaded<T, E> value)? loaded,
    TResult? Function(Error<T, E> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T, E> value)? loading,
    TResult Function(Loaded<T, E> value)? loaded,
    TResult Function(Error<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded<T, E> implements BlocState<T, E> {
  const factory Loaded(final T data) = _$Loaded<T, E>;

  T get data;
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<T, E, _$Loaded<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<T, E, $Res> {
  factory _$$ErrorCopyWith(
          _$Error<T, E> value, $Res Function(_$Error<T, E>) then) =
      __$$ErrorCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({E e});
}

/// @nodoc
class __$$ErrorCopyWithImpl<T, E, $Res>
    extends _$BlocStateCopyWithImpl<T, E, $Res, _$Error<T, E>>
    implements _$$ErrorCopyWith<T, E, $Res> {
  __$$ErrorCopyWithImpl(
      _$Error<T, E> _value, $Res Function(_$Error<T, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$Error<T, E>(
      freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$Error<T, E> implements Error<T, E> {
  const _$Error(this.e);

  @override
  final E e;

  @override
  String toString() {
    return 'BlocState<$T, $E>.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error<T, E> &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<T, E, _$Error<T, E>> get copyWith =>
      __$$ErrorCopyWithImpl<T, E, _$Error<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(E e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(E e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E e)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T, E> value) loading,
    required TResult Function(Loaded<T, E> value) loaded,
    required TResult Function(Error<T, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T, E> value)? loading,
    TResult? Function(Loaded<T, E> value)? loaded,
    TResult? Function(Error<T, E> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T, E> value)? loading,
    TResult Function(Loaded<T, E> value)? loaded,
    TResult Function(Error<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T, E> implements BlocState<T, E> {
  const factory Error(final E e) = _$Error<T, E>;

  E get e;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<T, E, _$Error<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
