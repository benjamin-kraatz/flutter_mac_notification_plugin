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
        case "getPlatformVersion":
            result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
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
        
        let actionAccept = NSUserNotificationAction(identifier: "action-accept", title: "Annehmen")
        let actionDismiss = NSUserNotificationAction(identifier: "action-dismiss", title: "Ablehnen")
        
        actions.append(actionAccept)
        actions.append(actionDismiss)
        
        let notification = NSUserNotification()
        notification.identifier = "test-not"
        notification.title = "Neuer Share"
        notification.subtitle = "Von BENN"
        notification.informativeText = "Hallo Du da, ich teste Benachrichtigungen"
        notification.soundName = NSUserNotificationDefaultSoundName
        notification.deliveryDate = NSDate(timeIntervalSinceNow: 3) as Date
        notification.hasReplyButton = true
        notification.responsePlaceholder = "Antworte hier"
        notification.hasActionButton = true
        notification.otherButtonTitle = "Mehr Info"
        notification.actionButtonTitle = "Mehr"
        notification.additionalActions = actions
        
        let notificationCenter = NSUserNotificationCenter.default
        notificationCenter.delegate = self
        notificationCenter.scheduleNotification(notification)
    }
}

