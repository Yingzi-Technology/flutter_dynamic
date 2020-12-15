#import "YingziFlutterDynamicpagePlugin.h"
#if __has_include(<yingzi_flutter_dynamicpage/yingzi_flutter_dynamicpage-Swift.h>)
#import <yingzi_flutter_dynamicpage/yingzi_flutter_dynamicpage-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "yingzi_flutter_dynamicpage-Swift.h"
#endif

@implementation YingziFlutterDynamicpagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftYingziFlutterDynamicpagePlugin registerWithRegistrar:registrar];
}
@end
