import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //self.window.secureApp();
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// extension  UIWindow {
// func secureApp() {
//   let field =UITextfield()
//   field.isSecureTextEntry =true
//   self.addSubview(field)
//   field.centerYAnchor.constraint{equalTo: self.centerYAnchor}.isActive = true
//   field.centerYAnchor.constraint{equalTo: self.centerYAnchor}.isActive = true
//   self.layer.superlayer?.addSublayer{field.layer}
//   field.layer.suberlayer?.first?.addSublayer{field.layer}

// }
  
// }