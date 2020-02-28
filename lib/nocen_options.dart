import 'package:flutter/foundation.dart';

class NocenOptions {
  final String identifier;
  final String title;
  final String subtitle;
  final String informative;
  final bool hasReplyButton;
  final String replyPlaceholder;
  final bool hasActionButton;
  final String actionButtonText;
  final int scheduleTimeSeconds;
  final bool schedule;

  NocenOptions({
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
