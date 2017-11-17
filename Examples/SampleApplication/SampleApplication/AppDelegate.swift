//
//  AppDelegate.swift
//  SampleApplication
//
//  Created by Anatoli Tauhen on 6/12/17.
//  Copyright © 2017 Lixar I.T. Inc. All rights reserved.
//

import UIKit
import LwayveSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    enum Constants {
        static let baseURL = "BASE_URL"
        static let authKey = "AUTHENTICATION_TOKEN"
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Log all messages from the LWAYVE SDK.
        LwayveSDK.sharedSDK.setLogLevel(.error, components: [.all])

        // Create the configuration used for the LWAYVE SDK.
        let configuration = LwayveSDKConfiguration(baseURL: URL(string: Constants.baseURL),
                                                   authenticationToken: Constants.authKey)

        // Attempt to initialize the LWAYVE SDK using the configuration values.
        // This may fail if the SDK is already initialized, the persistant storage cannot be created, or if an empty authenticationToken is provided.
        // Additional information about the failure can be seen in the logs at the LwayveSDKLogLevel.error level.
        do {
            try LwayveSDK.sharedSDK.initialize(configuration: configuration)
        } catch {
            NSLog("LwayveSDK initialization error: \(error)")
        }

        let language: LwayveLanguage = NSLocale.current.languageCode == "fr" ? .french : .english
        LwayveSDK.sharedSDK.language = language

        // Pass the launch options to the LWAYVE SDK.
        // The launch options are used by the SDK to retrieve any relevant notificaton information.
        LwayveSDK.sharedSDK.handleApplication(application, didFinishLaunchingWithOptions: launchOptions)

        return true
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Pass the notification data to the LWAYVE SDK so that it can process any information relevant to it.
        LwayveSDK.sharedSDK.handleApplication(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Pass the device token data to the LWAYVE SDK so that it can subscribe to receive remote notifications.
        LwayveSDK.sharedSDK.handleApplication(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
}
