import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nocen_plugin/nocen_options.dart';
import 'package:nocen_plugin/nocen_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                  'Click on this button and wait 3 seconds for a notification. You may be asked for permissions.'),
              FlatButton(
                child: Text('Show notification'),
                onPressed: _showNotification,
              ),
              StreamBuilder<String>(
                stream: MacNotifications.getAnswers,
                builder: (context, snapshot) {
                  if (snapshot.data == null) return Container();
                  return Text(snapshot.data);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showNotification() {
    try {
      MacNotifications.showNotification(
        NocenOptions(
            identifier: 'test-notifications',
            title: 'Hello',
            subtitle: 'This is a notification from Flutter to Mac',
            informative:
                'And it runs smooth with almost no cost when implementing ;)',
            schedule: true,
            scheduleTimeSeconds: 4,
            hasReplyButton: true,
            replyPlaceholder: 'Tell me about your day.'),
      );
    } on PlatformException {}
  }
}
