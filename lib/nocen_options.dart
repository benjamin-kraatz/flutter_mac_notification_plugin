import 'package:flutter/foundation.dart';

class NocenOptions {
  final String title;
  final String subtitle;
  final String informative;
  final bool hasReplyButton;
  final String replyButtonText;
  final bool hasActionButton;
  final String actionButtonTitle;

  NocenOptions({
    @required this.title,
    @required this.subtitle,
    this.informative = '',
    this.hasReplyButton = false,
    this.replyButtonText = '',
    this.hasActionButton = false,
    this.actionButtonTitle = '',
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
        assert(actionButtonTitle != null,
            "Do not pass any null values to NocenOptions!");
}
