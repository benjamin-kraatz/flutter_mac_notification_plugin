import 'dart:async';

import 'package:flutter/services.dart';

class NocenPlugin {
  static final NocenPlugin _instance = NocenPlugin._();

  factory NocenPlugin() {
    return _instance;
  }

  NocenPlugin._();

  static const MethodChannel _channel = const MethodChannel('nocen_plugin');

  static Future<void> get showNotification async {
    return _channel.invokeMethod('showNotification');
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
