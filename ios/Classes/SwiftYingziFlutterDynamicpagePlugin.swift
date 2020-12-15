import Flutter
import UIKit

public class SwiftYingziFlutterDynamicpagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "yingzi_flutter_dynamicpage", binaryMessenger: registrar.messenger())
    let instance = SwiftYingziFlutterDynamicpagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
