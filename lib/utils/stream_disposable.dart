import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreamDisposable {
  final List<StreamSubscription> _subscriptions = [];

  void cancelSubscriptions() {
    _subscriptions.forEach((subscription) {
      subscription.cancel();
    });
  }

  void addSubscription({
    required StreamSubscription subscription,
  }) {
    _subscriptions.add(subscription);
  }
}
