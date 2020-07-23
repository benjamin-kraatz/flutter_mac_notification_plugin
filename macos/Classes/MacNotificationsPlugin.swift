import Cocoa
import FlutterMacOS

private var _eventSink: FlutterEventSink?
public class MacNotificationsPlugin: NSObject, FlutterPlugin, FlutterStreamHandler, NSUserNotificationCenterDelegate {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = MacNotificationsPlugin()
    let eventChannelName = "com.bbarks.mac_notifications/notificationAnswer"
    let eventChannel = FlutterEventChannel(name: eventChannelName, binaryMessenger: registrar.messenger)
    eventChannel.setStreamHandler(instance)
    let channel = FlutterMethodChannel(name: "mac_notifications", binaryMessenger: registrar.messenger)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
          switch call.method {
          case "showNotification":

              let options = call.arguments as! Dictionary<String, Any>
              showNotification(with: options)
              result("done")
          default:
              result(FlutterMethodNotImplemented)
          }
      }

      public func userNotificationCenter(_ center: NSUserNotificationCenter, didActivate notification: NSUserNotification) {
          switch notification.activationType {
          case .replied:
              guard let response = notification.response else { return }
              print("User replied \(response)")
              _eventSink?(response.string)

          default: return
          }
      }


      public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
          _eventSink = events
          return nil
      }

      public func onCancel(withArguments arguments: Any?) -> FlutterError? {
          _eventSink = nil
          return nil
      }


      func showNotification(with options: Dictionary<String, Any>) {


          let notification = NSUserNotification()
          notification.identifier = (options["identifier"] as! String)
          notification.title = (options["title"] as! String)
          notification.subtitle = (options["subtitle"] as! String)
          notification.informativeText = (options["informative"] as! String)
          notification.soundName = NSUserNotificationDefaultSoundName
          notification.deliveryDate = NSDate(timeIntervalSinceNow: TimeInterval(options["scheduleTimeSeconds"] as! Int)) as Date
          notification.hasReplyButton = (options["hasReplyButton"] as! Bool)
          notification.responsePlaceholder = (options["replyPlaceholder"] as! String)
          notification.hasActionButton = (options["hasActionButton"] as! Bool)
          notification.actionButtonTitle = (options["actionButtonText"] as! String)

          let schedule = (options["schedule"] as! Bool)

          let notificationCenter = NSUserNotificationCenter.default
          notificationCenter.delegate = self

          if(schedule) {
              notificationCenter.scheduleNotification(notification)
          } else {
              notificationCenter.deliver(notification)
          }
      }
}
