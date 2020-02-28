import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:mac_notifications/nocen_options.dart';
import 'package:mac_notifications/mac_notifications.dart';

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
          title: const Text('Mac Notifications'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                  'Click on this button and wait 3 seconds for a notification. You may be asked for permissions.'),
              FlatButton(
                child: Text('Show  basic notification'),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  _showNotification(false);
                },
              ),
              FlatButton(
                child: Text('Show reply notification'),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  _showNotification(true);
                },
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                padding: const EdgeInsets.all(12),
                child: StreamBuilder<String>(
                  stream: MacNotifications.getAnswers,
                  builder: (context, snapshot) {
                    if (snapshot.data == null)
                      return Text(
                        'Your answer goes here.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    return Text(
                      snapshot.data,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showNotification(bool reply) {
    try {
      MacNotifications.showNotification(
        NocenOptions(
            identifier: 'test-notifications',
            title: 'Hello',
            subtitle: 'This is a notification from Flutter to Mac',
            informative:
                'And it runs smoothly with almost no cost when implementing ;)',
            schedule: true,
            scheduleTimeSeconds: 3,
            hasReplyButton: reply,
            replyPlaceholder: 'Tell me about your day.'),
      );
    } on PlatformException {}
  }
}
