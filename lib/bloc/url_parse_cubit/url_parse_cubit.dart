import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html';

import 'package:owlmarket_qa_connect/bloc/url_parse_cubit/url_parse_state.dart';

class UrlParseCubit extends Cubit<UrlParseState> {
  UrlParseCubit() : super(UrlParseState.open(Uri.parse('')));

  void open() {
    final currentUri = window.location.href;
    final uri = Uri.parse(currentUri);
    final queryParams = uri.queryParameters;
    if (queryParams.containsKey('requiresValidation')) {
      final requiresValidation = queryParams['requiresValidation'];
      if (requiresValidation == 'true') {
        emit(UrlParseState.requiresValidation(uri));
        return;
      }
      emit(UrlParseState.open(uri));
    }
  }

  doIfRequiresValidation(Function(Uri) function) {
    state.mapOrNull(
      requiresValidation: (uri) {
        function(uri.uri);
      },
    );
  }
}
