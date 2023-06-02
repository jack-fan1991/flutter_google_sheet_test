import 'package:freezed_annotation/freezed_annotation.dart';
part 'url_parse_state.freezed.dart';

@freezed
class UrlParseState with _$UrlParseState {
  const UrlParseState._();
  const factory UrlParseState.open(Uri uri) = _Open;
  const factory UrlParseState.requiresValidation(Uri uri) = _RequiresValidation;
}
