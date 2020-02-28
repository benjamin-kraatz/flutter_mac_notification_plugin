import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nocen_plugin/nocen_options.dart';

class NocenPlugin {
  static final NocenPlugin _instance = NocenPlugin._();

  factory NocenPlugin() {
    return _instance;
  }

  NocenPlugin._();

  static const MethodChannel _channel = const MethodChannel('nocen_plugin');

  static Future<void> showNotification(NocenOptions nocenOptions) async {
    return _channel.invokeMethod('showNotification', nocenOptions.toMap());
  }

  static const EventChannel _answerChannel =
      const EventChannel('com.bbarks.nocen_plugin/notificationAnswer');
  Stream<String> _answerEvents;

  static Stream<String> get getAnswers {
    if (_instance._answerEvents == null) {
      _instance._answerEvents = _answerChannel
          .receiveBroadcastStream()
          .map<String>((dynamic data) => data);
    }

    return _instance._answerEvents;
  }
}
