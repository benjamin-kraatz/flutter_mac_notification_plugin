#import "NocenPlugin.h"
#if __has_include(<nocen_plugin/nocen_plugin-Swift.h>)
#import <nocen_plugin/nocen_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "nocen_plugin-Swift.h"
#endif

@implementation NocenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNocenPlugin registerWithRegistrar:registrar];
}
@end
