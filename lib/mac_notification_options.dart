import 'package:flutter/foundation.dart';

/// This provides information about a notification and must be given
/// to [MacNotifications.showNotification].
class MacNotificationOptions {
  /// A unique identifier. This must not be null.
  final String identifier;

  /// The bold title. This must not be null.
  final String title;

  /// The subtitle, shown underneath title. This must not be null.
  final String subtitle;

  /// An optional informative text, show under subtitle.
  final String informative;

  /// If you want to have a notification with reply text field, set this to true.
  ///
  /// Defaults to false.
  final bool hasReplyButton;

  /// Type your placeholder for the reply text field.
  ///
  /// Defaults to an empty string.
  final String replyPlaceholder;

  /// Getting informed as an action is pressed is currently unsupported in this plugin.
  final bool hasActionButton;

  /// Getting informed as an action is pressed is currently unsupported in this plugin.
  final String actionButtonText;

  /// Define how long to wait before delivering a notification.
  ///
  /// This value defaults to 1 and must never be less.
  final int scheduleTimeSeconds;

  /// To define a schedule notification, set this to true.
  /// A notification is delivered after [scheduleTimeSeconds] if true.
  ///
  /// Defaults to false.
  final bool schedule;

  MacNotificationOptions({
    @required this.identifier,
    @required this.title,
    @required this.subtitle,
    this.informative = '',
    this.hasReplyButton = false,
    this.replyPlaceholder = '',
    this.hasActionButton = false,
    this.actionButtonText = '',
    this.schedule = false,
    this.scheduleTimeSeconds = 1,
  })  : assert(
            identifier != null, "You need an identifier for this notification"),
        assert(title != null, "Please give your notification a title"),
        assert(subtitle != null, "Please give your notification a subtitle"),
        assert(informative != null,
            "Do not pass any null values to NocenOptions!"),
        assert(hasReplyButton != null,
            "Do not pass any null values to NocenOptions!"),
        assert(replyPlaceholder != null,
            "Do not pass any null values to NocenOptions!"),
        assert(hasActionButton != null,
            "Do not pass any null values to NocenOptions!"),
        assert(actionButtonText != null,
            "Do not pass any null values to NocenOptions!"),
        assert(schedule != null,
            "To schedule a notification, set schedule to true and scheduleTimeSeconds to a minimum of 1"),
        assert(scheduleTimeSeconds != null,
            "Do not pass any null values to NocenOptions!"),
        assert(scheduleTimeSeconds >= 1,
            "Schedule time in seconds must be greater 1 due to Apple's restrictions");

  Map<String, dynamic> toMap() {
    return {
      'identifier': identifier,
      'title': title,
      'subtitle': subtitle,
      'informative': informative,
      'hasReplyButton': hasReplyButton,
      'replyPlaceholder': replyPlaceholder,
      'hasActionButton': hasActionButton,
      'actionButtonText': actionButtonText,
      'scheduleTimeSeconds': scheduleTimeSeconds,
      'schedule': schedule,
    };
  }
}
