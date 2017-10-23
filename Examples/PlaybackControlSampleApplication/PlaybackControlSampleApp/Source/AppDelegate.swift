//
//  AppDelegate.swift
//  PlaybackControlSampleApp
//
//  Created by Anatoli Tauhen on 6/27/17.
//  Copyright © 2017 Lixar. All rights reserved.
//

import UIKit
import LwayveSDK
import LXProxSeeSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    enum Constants {
        static let baseURL = "BASE_URL"
        static let authKey = "AUTHENTICATION_TOKEN"
        static let proxseeAPIKey = "PROXSEE_API_KEY"
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Register for remote notifications so application can receive notifications in background for further processing
        application.registerForRemoteNotifications()

        // Initialize ProxSeeSDK
        LXProxSeeSDKManager.launchProxSee(withApiKey: Constants.proxseeAPIKey)

        // Log all messages from the LWAYVE SDK.
        LwayveSDK.sharedSDK.setLogLevel(.error, components: [.all])

        // Create the configuration used for the LWAYVE SDK.
        let configuration = LwayveSDKConfiguration(baseURL: URL(string: Constants.baseURL),
                                                   authenticationToken: Constants.authKey)

        // Set delegate before calling LwayveSDK.sharedSDK.initialize to be able to receive lwayveSDK(didInit:) callback
        LwayveSDK.sharedSDK.add(delegate: self)

        // Attempt to initialize the LWAYVE SDK using the configuration values.
        // This may fail if the SDK is already initialized, the persistant storage cannot be created, or if an empty authenticationToken is provided.
        // Additional information about the failure can be seen in the logs at the LwayveSDKLogLevel.error level.
        do {
            try LwayveSDK.sharedSDK.initialize(configuration: configuration)
        } catch {
            NSLog("LwayveSDK initialization error: \(String (describing: error))")
        }

        // Pass the launch options to the LWAYVE SDK.
        // The launch options are used by the SDK to retrieve any relevant notificaton information.
        LwayveSDK.sharedSDK.handleApplication(application, didFinishLaunchingWithOptions: launchOptions)

        return true
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Pass the notification data to the LWAYVE SDK so that it can process any information relevant to it.
        LwayveSDK.sharedSDK.handleApplication(application, didReceiveRemoteNotification: userInfo)

        completionHandler(UIBackgroundFetchResult.newData)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        // Pass the notification data to the LWAYVE SDK so that it can process any information relevant to it.
        LwayveSDK.sharedSDK.handleApplication(application, didReceiveRemoteNotification: userInfo)
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Pass the device token data to the LWAYVE SDK so that it can subscribe to receive remote notifications.
        LwayveSDK.sharedSDK.handleApplication(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }

    fileprivate func configureLwayveSDK() {
        let language: LwayveLanguage = NSLocale.current.languageCode == "fr" ? .french : .english
        LwayveSDK.sharedSDK.language = language
    }

    fileprivate func configureProxSeeSDK() {
        // Set the AppDelegate as the tags observer. See LXProxSeeNotificationsHandler below.
        // ProxSee will be used to pass location tags to the LWAYVE SDK.
        self.addProxSeeNotifcationObserver()

        // Pass LWAYVE device id to ProxSee SDK to link the data captured by LWAYVE to the location tag data captured by the Proxsee SDK.
        LwayveSDK.sharedSDK.getAnalyticsDeviceId { (deviceId) in
            LXProxSeeSDKManager.sharedInstance().updateMetadata(["lwayve_deviceid": deviceId], completionHandler: { (success, error) in
                if !success {
                    NSLog("Error sending lwayve deviceid to proxsee: \(String (describing: error))")
                }
            })
        }
    }
}

extension AppDelegate: LwayveSDKDelegate {
    public func lwayveSDK(didInit sdk: LwayveSDK) {
        self.configureLwayveSDK()
        self.configureProxSeeSDK()
    }

    public func lwayveSDK(didDeinit sdk: LwayveSDK) {
    }
}

// MARK: - LXProxSeeNotificationsHandler
extension AppDelegate {
    override func didChangeTagsSet(_ proximityNotificationObject: LXProxSeeNotificationObject!) {
        // Retrieve the newly updated tags and pass them to LWAYVE as locations.
        guard let tags = proximityNotificationObject.currentTagsChangeSet.tags as? Set<String> else {
            return
        }

        NSLog("ProxSee tag set updated: \(tags)")

        LwayveSDK.sharedSDK.set(locations: Array(tags))
    }
}
