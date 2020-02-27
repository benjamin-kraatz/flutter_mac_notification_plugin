import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
            ],
          ),
        ),
      ),
    );
  }

  void _showNotification() {
    try {
      NocenPlugin.showNotification;
    } on PlatformException {}
  }
}
