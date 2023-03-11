import UIKit
import Flutter
import CoreSpotlight
import MobileCoreServices

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        if (!UserDefaults.standard.bool(forKey: "hasIndexedApp")) {
            let searchableItem = CSSearchableItem(
                uniqueIdentifier: "dev.alkhalaf.alyamamah",
                domainIdentifier: "dev.alkhalaf.alyamamah",
                attributeSet: createAttributeSet()
            )
            CSSearchableIndex.default().indexSearchableItems([searchableItem])
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func createAttributeSet() -> CSSearchableItemAttributeSet {
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        attributeSet.title = "Al Yamamah"
        attributeSet.keywords = ["اليمامة", "alyamamah", "yamamah", "يمامة", "جامعة", "university", "app", "iOS"]
        attributeSet.contentDescription = "An app for alyamamah university students."
        
        return attributeSet
    }
}
