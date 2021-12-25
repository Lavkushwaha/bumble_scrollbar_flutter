#import "BumbleScrollbarPlugin.h"
#if __has_include(<bumble_scrollbar/bumble_scrollbar-Swift.h>)
#import <bumble_scrollbar/bumble_scrollbar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bumble_scrollbar-Swift.h"
#endif

@implementation BumbleScrollbarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBumbleScrollbarPlugin registerWithRegistrar:registrar];
}
@end
