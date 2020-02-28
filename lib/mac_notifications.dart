import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mac_notifications/nocen_options.dart';

/// Show a notification on macOS. You can highly customize this notification
/// with [NocenOptions].
class MacNotifications {
  static final MacNotifications _instance = MacNotifications._();

  factory MacNotifications() {
    return _instance;
  }

  MacNotifications._();

  static const MethodChannel _channel = const MethodChannel('nocen_plugin');

  /// Show a notification with provided [NocenOptions]. This field is required as it holds title, subtitle and more.
  static Future<void> showNotification(NocenOptions nocenOptions) async {
    return _channel.invokeMethod('showNotification', nocenOptions.toMap());
  }

  static const EventChannel _answerChannel =
      const EventChannel('com.bbarks.nocen_plugin/notificationAnswer');
  Stream<String> _answerEvents;

  /// Use this to listen to reply messages from the notification.
  /// To make a notification to be replied, set [hasReplyButton] to true when
  /// defining [NocenOptions].
  static Stream<String> get getAnswers {
    if (_instance._answerEvents == null) {
      _instance._answerEvents = _answerChannel
          .receiveBroadcastStream()
          .map<String>((dynamic data) => data);
    }

    return _instance._answerEvents;
  }
}
