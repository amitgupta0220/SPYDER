#import "SpyderPlugin.h"
#if __has_include(<spyder/spyder-Swift.h>)
#import <spyder/spyder-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "spyder-Swift.h"
#endif

@implementation SpyderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSpyderPlugin registerWithRegistrar:registrar];
}
@end
