import 'package:flutter/foundation.dart';

class NocenOptions {
  final String title;
  final String subtitle;
  final String informative;
  final bool hasReplyButton;
  final String replyButtonText;
  final bool hasActionButton;
  final String actionButtonText;

  NocenOptions({
    @required this.title,
    @required this.subtitle,
    this.informative = '',
    this.hasReplyButton = false,
    this.replyButtonText = '',
    this.hasActionButton = false,
    this.actionButtonText = '',
  })  : assert(title != null, "Please give your notification a title"),
        assert(subtitle != null, "Please give your notification a subtitle"),
        assert(informative != null,
            "Do not pass any null values to NocenOptions!"),
        assert(hasReplyButton != null,
            "Do not pass any null values to NocenOptions!"),
        assert(replyButtonText != null,
            "Do not pass any null values to NocenOptions!"),
        assert(hasActionButton != null,
            "Do not pass any null values to NocenOptions!"),
        assert(actionButtonText != null,
            "Do not pass any null values to NocenOptions!");

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'informative': informative,
      'hasReplyButton': hasReplyButton,
      'replyButtonText': replyButtonText,
      'hasActionButton': hasActionButton,
      'actionButtonText': actionButtonText,
    };
  }
}
