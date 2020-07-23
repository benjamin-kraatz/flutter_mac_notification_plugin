// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

export 'mac_notification_options.dart';

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mac_notifications/mac_notification_options.dart';

/// Show a notification on macOS. You can highly customize this notification
/// with [MacNotificationOptions].
class MacNotifications {
  static final MacNotifications _instance = MacNotifications._();

  factory MacNotifications() {
    return _instance;
  }

  MacNotifications._();

  static const MethodChannel _channel =
      const MethodChannel('mac_notifications');

  /// Show a notification with provided [MacNotificationOptions]. This field is required as it holds title, subtitle and more.
  static Future<void> showNotification(
      MacNotificationOptions nocenOptions) async {
    return _channel.invokeMethod('showNotification', nocenOptions.toMap());
  }

  static const EventChannel _answerChannel =
      const EventChannel('com.bbarks.mac_notifications/notificationAnswer');
  Stream<String> _answerEvents;

  /// Use this to listen to reply messages from the notification.
  /// To make a notification to be replied, set [hasReplyButton] to true when
  /// defining [MacNotificationOptions].
  static Stream<String> get getAnswers {
    if (_instance._answerEvents == null) {
      _instance._answerEvents = _answerChannel
          .receiveBroadcastStream()
          .map<String>((dynamic data) => data);
    }

    return _instance._answerEvents;
  }
}
