import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_state.freezed.dart';

@freezed
class BlocState<T, E> with _$BlocState<T, E> {
  const factory BlocState.loading() = Loading;
  const factory BlocState.loaded(T data) = Loaded;
  const factory BlocState.error(E e) = Error;
}
