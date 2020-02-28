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

Here's a basic usage example. See `example` folder on (https://github.com/beagle-barks/flutter_mac_notification_plugin/tree/master/example)[GitHub] for more information.

### Basic notification

```dart
try {
     MacNotifications.showNotification(
       NocenOptions(
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
       NocenOptions(
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