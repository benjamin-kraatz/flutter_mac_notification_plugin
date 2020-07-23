# Mac Notifications

This package helps you to display a notification on macOS platform. You can highly customize this notification.

*NOTE: To be able to use this package, you must be on `master` Flutter channel.*


## Installation

See `Installing` tab to see how to integrate.

Wherever you want to use this plugin, do

```dart
import 'package:mac_notifications/mac_notifications.dart';
```


## Use

Here's a basic usage example. See `example` folder on (GitHub)[https://github.com/beagle-barks/flutter_mac_notification_plugin/] for more information.

### Basic notification

```dart
try {
     MacNotifications.showNotification(
       MacNotificationOptions(
           identifier: 'test-notifications',
           title: 'Hello',
           subtitle: 'This is a notification from Flutter to Mac',
           informative:
               'And it runs smoothly with almost no cost when implementing ;)',),
     );
} on PlatformException {}
```


### Notification with reply


```dart
try {
     MacNotifications.showNotification(
       MacNotificationOptions(
           identifier: 'test-notifications',
           title: 'Hello',
           subtitle: 'This is a notification from Flutter to Mac',
           informative:
               'And it runs smoothly with almost no cost when implementing ;)',
           hasReplyButton: true,
           replyPlaceholder: 'Your answer goes here',
           ),
     );
} on PlatformException {}
```

### Get the reply

To get the text the user enters in a reply notification, you can simply use a `StreamBuilder` or `StreamSubscription`.


```dart
StreamBuilder<String>(
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
)
```