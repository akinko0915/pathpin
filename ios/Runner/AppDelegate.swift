import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)


    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let apiKeyChannel = FlutterMethodChannel(name: "com.example.app/api_key",
                                              binaryMessenger: controller.binaryMessenger)
    
    apiKeyChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "setGoogleMapsApiKey" {
        if let apiKey = call.arguments as? String {
          GMSServices.provideAPIKey(apiKey)
          result("API Key set successfully")
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT", message: "API key not provided", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
