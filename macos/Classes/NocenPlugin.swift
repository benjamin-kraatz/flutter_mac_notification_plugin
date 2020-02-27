import Cocoa
import FlutterMacOS

public class NocenPlugin: NSObject, FlutterPlugin, NSUserNotificationCenterDelegate {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "nocen_plugin", binaryMessenger: registrar.messenger)
        let instance = NocenPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "showNotification":
            showNotification()
            result("done")
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func userNotificationCenter(_ center: NSUserNotificationCenter, didActivate notification: NSUserNotification) {
        print("ACTIVATION FETCHED")
    }
    
    public func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
    
    func showNotification() {
        
        var actions = [NSUserNotificationAction]()
        
        let actionAccept = NSUserNotificationAction(identifier: "action-accept", title: "OK")
        let actionDismiss = NSUserNotificationAction(identifier: "action-dismiss", title: "Quite good")
        
        actions.append(actionAccept)
        actions.append(actionDismiss)
        
        let notification = NSUserNotification()
        notification.identifier = "test-not"
        notification.title = "Notification"
        notification.subtitle = "Scheduled after 3 seconds"
        notification.informativeText = "This plugin example shows how to use it to display notifications on macOS > 10.8. It was scheduled after 3 seconds. Answers cannot be read yet."
        notification.soundName = NSUserNotificationDefaultSoundName
        notification.deliveryDate = NSDate(timeIntervalSinceNow: 3) as Date
        notification.hasReplyButton = true
        notification.responsePlaceholder = "Your answer"
        notification.hasActionButton = true
        notification.otherButtonTitle = "More"
        notification.actionButtonTitle = "More"
        notification.additionalActions = actions
        
        let notificationCenter = NSUserNotificationCenter.default
        notificationCenter.delegate = self
        notificationCenter.scheduleNotification(notification)
    }
}

