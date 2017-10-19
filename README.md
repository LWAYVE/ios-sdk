# LWAYVE SDK for iOS
The following document provides background information on the LWAYVE platform as well as provides setup and usage instructions for the LWAYVE SDK for iOS. The content in this document is divided into the following sections:

  - [Section 1: Introducing LWAYVE and Contextual Audio Experiences Audio](#section-1-introducing-lwayve-and-contextual-audio-experiences)
    * [Background](#background)
    * [Who are the Players?](#who-are-the-players)
    * [What are the Components of the LWAYVE Platform?](#what-are-the-components-of-the-lwayve-platform)
    * [How Does LWAYVE Work?](#how-does-lwayve-work)
  - [Section 2: Implementing the LWAYVE and ProxSee SDKs in an iOS Project](#section-2-implementing-the-lwayve-and-proxsee-sdks-in-an-ios-project)
    * [Prerequisites](#prerequisites)
    * [Add the LWAYVE and ProxSee SDKs as Dependencies](#add-the-lwayve-and-proxsee-sdks-as-dependencies)
    * [Configure Application Background Modes](#configure-application-background-modes)
    * [Initialize the LWAYVE and ProxSee SDKs](#initialize-the-lwayve-and-proxsee-sdks)
    * [Enable Communication Between the LWAYVE and ProxSee SDKs](#enable-communication-between-the-lwayve-and-proxsee-sdks)
    * [Set Up Branded Playback Control](#set-up-branded-playback-control)
  - [Section 3: Testing LWAYVE](#section-3-testing-lwayve)
    * [API](#api)
    * [Classes](#classes)

## Section 1: Introducing LWAYVE and Contextual Audio Experiences

### Background
LWAYVE is an audio platform that provides event attendees with Contextual Audio Experiences and can be embedded to augment any mobile application. A Contextual Audio Experience serves as a personalized audio guide making any event as engaging, easy, and enjoyable as possible.

Contextual Audio Experiences deliver optimal audio to a Listener based on their current context:

- Time
- Location
- User likes
- Breaking information about and around the event

Contextual Audio Experiences are:

- **Contextual**. The audio in a Contextual Audio Experience will be different for each user at the event based on their time, location, user likes, and situation.
- **Choreographed**. Contextual Audio Experiences are carefully choreographed and curated to ensure the highest quality audio experience for the event.
- **Integrated**. The LWAYVE platform can be integrated into any mobile application on the most popular mobile devices and requires minimal interaction on the part of the Listener.
- **Measured**. The usage data collected with LWAYVE allows Customers to measure the impact of the audio advertising on a Listener's actions and then optimize the Contextual Audio Experience accordingly.



### Who are the Players?

There are six main players with roles in the LWAYVE platform.  

- **Developers**: A Developer integrates the LWAYVE platform into the mobile application. By integrating LWAYVE, the mobile application will contain a Play button which Listeners can tap to get a Contextual Audio Experience based on time, location, and user likes.
- **Experience Designer**: An Experience Designer choreographs the Contextual Audio Experience and sources the content. An Experience Designer essentially builds a Conextual Audio Experience based on an event (e.g., music festival). The Contextual Audio Experience contains audio that will be passed to the Listener based on their time, location, and user likes. For example, an Experience Designer for a music festival may choose to have Listeners hear traffic information on their way to the event and stage schedules while at the event.  
- **Listener**: The end-user that enjoys a high-value, personalized Contextual Audio Experience based on their time, location, and user likes. The Listener hears the Contextual Audio Experience by tapping a Play button on the mobile application.
- **Experience Conductor**: An Experience Conductor is the eyes and ears on the ground at an event. Experience Conductors control the situational audio in a Contextual Audio Experience and make adjustments based on real-time information. For example, at a music festival, if the concert that was originally scheduled for 9:00pm has been moved to 10:00pm, the Experience Conductor can adjust the Contextual Audio Experience accordingly.
- **Customer**: The company or individual that has purchased LWAYVE to implement Contextual Audio Experiences. LWAYVE is integrated into the Customer's mobile application in order to provide Listeners with Contextual Audio Experiences.
- **Administrator**: The overall LWAYVE platform is managed by Lixar; however, Customers manage their own Contextual Audio Experiences and user roles.

### What are the Components of the LWAYVE Platform?
The components to LWAYVE can be divided into the following main categories: Mobile SDKs, Customer Mobile Application, LWAYVE Service, and optionally, ProxSee Service.

#### Mobile SDKs
As part of their role, Developers integrate the following two SDKS into the mobile application:
- **LWAYVE SDK**: The LWAYVE SDK handles location (with the help of the ProxSee SDK), time, and contextual audio parameters.
- **ProxSee SDK**: The ProxSee SDK passes location tags to the LWAYVE SDK. For full information on the ProxSee SDK, refer to [https://github.com/proxsee](https://github.com/proxsee).

#### Customer Mobile Application
- **Customer Mobile Application**: This is the mobile application in which the LWAYVE and ProxSee SDKs will be integrated. By integrating the SDKs, a simple LWAYVE Play button will appear in the mobile application. All Listeners need to do is tap the Play button to start their Contextual Audio Experience.  

#### Experience Service and Contextual Audio Experience
- **Experience Service**: This is the backend platform on which the Experience Designer creates a Contextual Audio Experience.
- **Contextual Audio Experience**: This is the content created on the Experience Service.
  - **Curated Audio**: This is the audio that has been gathered by the Experience Designer during the initial planning and design stages. This audio is planned around a Listener's time, location, and user likes. For example, for a music festival, the Experience Designer might create curated audio based on the performance schedule.   
  - **Situational Audio**: This is audio that is gathered by the Experience Conductor "on the ground" at the event. For example, at a music festival, sudden unpredicted weather changes may prompt the Experience Conductor to create situational audio for safety precautions due to inclement weather (e.g., advising Listeners to take shelter).  
  - **Time**: The Contextual Audio Experience will provide the Listener with different content depending on the time. For example, at a music festival, at 4:00pm when the gates open, the audio may be related to entrance lineups and at 8:00pm the audio may be related to the concert schedule.
  - **Location**: The Contextual Audio Experience will differ depending on the location of the Listener. For example, if the Listener is standing next to the food tent, the audio may be related to menu items and meal specials.
  - **User Likes**: These are settings set by the Listener in the Customer mobile application.

### How Does LWAYVE Work?
The following image depicts the high-level LWAYVE Contextual Audio Experience workflow:

![Communication Diagram](https://drive.google.com/uc?export=download&id=0B6FLg-DILCSrUm1ocFVGVnlMc0k)

## Section 2: Implementing the LWAYVE and ProxSee SDKs in an iOS Project
Incorporating the LWAYVE and ProxSee SDKs in your iOS project is a simple four-step process:

1. [Add the LWAYVE and ProxSee SDKs as Dependencies](#add-the-lawayve-and-proxsee-sdks-as-dependencies)
2. [Configure Application Background Modes](#configure-application-background-modes)
3. [Initialize the LWAYVE and ProxSee SDKs](#initialize-the-lwayve-and-proxsee-sdks)
4. [Set Up an Event Logger](#set-up-an-event-logger)

### Prerequisites
The instructions have been provided below with the following assumptions:

- A Customer-specific environment has been provisioned
- An Authorization token has been provided
- A ProxSee API key has been provided
- An Experience Designer has created a Contextual Audio Experience and uploaded it for your environment. Alternatively, a Sample Lixar Experience has been uploaded for your environment.
- The corresponding audio files for the Contextual Audio Experience have been uploaded to your environment
- If ProxSee services are being used, Location tags needed for the LWAYVE Contextual Audio Experience have been defined within the ProxSee environment

### Add the LWAYVE and ProxSee SDKs as Dependencies
The first step in setting up LWAYVE is to add both the LWAYVE SDK and the ProxSee SDK as dependencies in your iOS project. The LWAYVE SDK handles the time, location, and audio of the Contextual Audio Experience. The ProxSee SDK passes the location tags to the LWAYVE SDK so that the LWAYVE SDK can complete the location aspect of the Contextual Audio Experience.

#### Add the LWAYVE and ProxSee SDKs as Dependencies
##### Using CocoaPods (recomended)
You can get the LWAYVE and ProxSee SDKs for iOS on Cocoapods:

- LWAYVE - [https://cocoapods.org/pods/LwayveSDK](https://cocoapods.org/pods/LwayveSDK)
- ProxSee - [https://cocoapods.org/pods/ProxSeeSDK](https://cocoapods.org/pods/ProxSeeSDK)

In order to add and manage the LWAYVE and ProxSee SDKs as dependencies in your iOS project, you must first install CocoaPods.

```
$ gem install cocoapods

```
In your iOS project, create a file named ```Podfile```.

In your ```Podfile```, add the LWAYVE and ProxSee SDKs as dependencies.

```
pod 'LwayveSDK'
pod 'ProxSeeSDK'
```
Run the install command.
```
$ pod install
```
##### Manually

Please use this approach only if you have strict requirements not to use CocoaPods, as this method is more difficult and error prone.

1. Add LwayveSDK.framework to the Embedded Binaries section of your application. The latest version of the framework is available at [https://github.com/LWAYVE/ios-sdk/releases](#https://github.com/LWAYVE/ios-sdk/releases).
2. Integrate the ProxSeeSDK. Full instructions are available at [https://github.com/proxsee/sdk-ios#add-the-proxsee-sdk-to-your-ios-project](#https://github.com/proxsee/sdk-ios#add-the-proxsee-sdk-to-your-ios-project).
3. Integrate Firebase Cloud Messaging by following the instructions in the "Integrate without CocoaPods" section at [https://firebase.google.com/docs/ios/setup#frameworks](#https://firebase.google.com/docs/ios/setup#frameworks).
4. Integrate other third-party dependencies using Carthage (recommended) or manually:

	- Using Carthage (recommended):
		1. Install Carthage. Full details are available at [https://github.com/Carthage/Carthage](#https://github.com/Carthage/Carthage)
		2. Place files ```Cartfile``` and ```Cartfile.resolved``` in a directory on your Mac.
		3. Perform the following commands in Terminal:

			```
			$ cd <your_directory>
			$ carthage bootstrap --platform iOS

			```
		4. Add the frameworks from <your_directory>/Carthage/Build/iOS to the Embedded Binaries section of your application.
	- Manually:
		- YapDatabase - [https://github.com/yapstudios/YapDatabase](#https://github.com/yapstudios/YapDatabase). Version 3.0 (or compatible) must be used.
		- Alamofire - [https://github.com/Alamofire/Alamofire](#https://github.com/Alamofire/Alamofire). Version 4.5.0 (or compatible) must be used.
		- SwiftyJSON - [https://github.com/SwiftyJSON/SwiftyJSON](#https://github.com/SwiftyJSON/SwiftyJSON). Version 3.1.4 (or compatible) must be used.
		- keychain-swift - [https://github.com/evgenyneu/keychain-swift](#https://github.com/evgenyneu/keychain-swift). Version 8.0.2 (or compatible) must be used.
		- CocoaLumberjack - [https://github.com/CocoaLumberjack/CocoaLumberjack](#https://github.com/CocoaLumberjack/CocoaLumberjack). Version 3.2.0 (or compatible) must be used.

### Configure Application Background Modes

The following application background modes for the LWAYVE SDK must be configured:

- audio: Allows your application to play audio or stream audio/video using AirPlay.

To configure the above application modes in your application, add the following to your application plist:

```
<key>UIBackgroundModes</key>
<array>
	<string>audio</string>
</array>

```

Refer to https://github.com/proxsee/sdk-ios#add-the-proxsee-sdk-to-your-ios-project to configure ProxSee SDK.

### Initialize the LWAYVE and ProxSee SDKs
The next step is to initialize (launch) both the LWAYVE SDK and the ProxSee SDK.

#### Initialize the LWAYVE SDK
When initializing the LWAYVE SDK, you need to pass the Authentication token provided to you by Lixar.  

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

  // Create the configuration used for the LWAYVE SDK.
  let configuration = LwayveSDKConfiguration(baseURL: URL(string: settings.value(forSetting: .BaseURL)),
  authenticationToken: settings.value(forSetting: .AuthenticationKey))

  // Set the delegate before calling LwayveSDK.sharedSDK.initialize to be able to receive lwayveSDK(didInit:) callback
  LwayveSDK.sharedSDK.add(delegate: self)

  // Attempt to initialize the LWAYVE SDK using the configuration values.
  // This may fail if the SDK is already initialized, the persistent storage cannot be created, or if an empty authenticationToken is provided.
  do {
    try LwayveSDK.sharedSDK.initialize(configuration: configuration)
  } catch {
    NSLog("LwayveSDK initialization error: \(error)")
  }

  // Pass the launch options to the LWAYVE SDK.
  // The launch options are used by the SDK to retrieve any relevant notification information.
  LwayveSDK.sharedSDK.handleApplication(application, didFinishLaunchingWithOptions: launchOptions)

  return true
}
```

#### Initialize the ProxSee SDK
When initializing and launching the ProxSee SDK you need to pass the ProxSee API key which passes the location information from the ProxSee backend. The ProxSee API Key has been provided to you by Lixar.
```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  // Launch the ProxSee SDK and set the AppDelegate as the tags observer.
  // ProxSee will be used to pass location tags to the LWAYVE SDK.
  LXProxSeeSDKManager.launchProxSee(withApiKey: proxSeeAPIKey))

  return true
}
```
### Enable Communication Between the LWAYVE and ProxSee SDKs
Now that the LWAYVE SDK and ProxSee SDK have been added to your project and initialized, you need to ensure that they can communicate with each other. This is done by sending the LWAYVE Device ID to the ProxSee SDK as well as sending ProxSee locations to the LWAYVE SDK. Sending the LWAYVE Device ID to the ProxSee SDK is required to link the data captured by LWAYVE to the location tag data captured by the Proxsee SDK.

#### Send the LWAYVE Device ID to ProxSee SDK
Add the following code to your mobile application.


```

...


public func lwayveSDK(didInit sdk: LwayveSDK) {
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
...

```

Note: You can see an example of the implementation of the full initialization sequence in the application delegate of PlaybackControlSampleApp (https://github.com/LWAYVE/ios-sdk/blob/master/Examples/PlaybackControlSampleApplication/PlaybackControlSampleApp/Source/AppDelegate.swift)

#### Send ProxSee Locations to the LWAYVE SDK
Add the following code to your mobile application.

```

...
    // Set the AppDelegate as the tags observer. See LXProxSeeNotificationsHandler below.
    // ProxSee will be used to pass location tags to the LWAYVE SDK.
    self.addProxSeeNotifcationObserver()
...

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

```


### Set Up Branded Playback Control

LwayvePlaybackControlView can be used to provide all of the required UI for the LWAYVE SDK.  It provides Play, Skip, and Rewind actions as well as an indication of playback status.

LwayvePlaybackControlView is a subclass of UIView. It can be used with or without Storyboard or Xib.

#### With Storyboard or Xib

To add ```LwayvePlaybackControlView``` using Storyboard or Xib:

1. Add a view
2. Set the view class to **LwayvePlaybackControlView**.
3. Set the module to **LwaveSDK**.
4. Create an IBOutlet to the view.
5. Assign an SDK instance to the **LwayvePlaybackControlView.lwayveSDK** property (e.g., self.playbackControl.lwayveSDK = LwayveSDK.sharedSDK).

#### From Code

To add  ```LwayvePlaybackControlView``` from code:

1. Create an instance of  **LwayvePlaybackControlView**(e.g., let playbackControl = LwayvePlaybackControlView(frame: frame)).
2. Assign an SDK instance to the **LwayvePlaybackControlView.lwayveSDK** property (e.g., playbackControl.lwayveSDK = LwayveSDK.sharedSDK).
3. Add the view to your super view.

## Section 3: Testing LWAYVE

### API

You can test LWAYVE by using the API documented on Swagger. You can access Swagger through the following URL:

[https://gateway.lwayve.com/swagger-ui/index.html](https://gateway.lwayve.com/swagger-ui/index.html)

### LWAYVE SDK Reference

For LWAYVE SDK reference information (e.g., classes, global variables, enums, protocols, and structs) refer to [https://lwayve.github.io/ios/docs/api_docs/Classes.html](https://lwayve.github.io/ios/docs/api_docs/Classes.html).
