import UIKit
import Flutter
import GoogleMaps
import webview_flutter_wkwebview

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyDLlUT5h92XtiUVVC5yD6rH6oNbN5Zq_1A")
   // GMSServices.provideAPIKey("AIzaSyB6WR15jGgS1doj6n2HUZg4fsmpk96nQTQ")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

@objc //This annotation allow Swift can be reachable by Objective-C
extension FWFUIDelegate {
    @objc
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            completionHandler()
        })
        topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    @objc
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            completionHandler(true)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completionHandler(false)
        })
        topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    func topViewController() -> UIViewController? {
        return topViewControllerWithRootViewController(getCurrentWindow().rootViewController)
    }
    
    func topViewControllerWithRootViewController(_ viewController: UIViewController?) -> UIViewController? {
        guard let viewController = viewController else { return nil }
        if let presentedViewController = viewController.presentedViewController {
            return topViewControllerWithRootViewController(presentedViewController)
        } else if let tabBarController = viewController as? UITabBarController {
            return topViewControllerWithRootViewController(tabBarController.selectedViewController)
        } else if let navigationController = viewController as? UINavigationController {
            return topViewControllerWithRootViewController(navigationController.visibleViewController)
        } else {
            return viewController
        }
    }
    
    func getCurrentWindow() -> UIWindow {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != .normal {
            for window in UIApplication.shared.windows {
                if window.windowLevel == .normal {
                    return window
                }
            }
        }
        return window!
    }
}
