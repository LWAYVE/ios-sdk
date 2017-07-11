# LWAYVE SDK for iOS
The following document provides background information on the LWAYVE platform as well as provides setup and usage instructions for the LWAYVE SDK for iOS. The content in this document is divided into the following sections:

  - [Section 1: Introducing LWAYVE and Contextual Audio Experiences Audio](#section-1-introducing-lwayve-and-contextual-audio-experiences)
    * [Background](#background)
    * [Who are the Players?](#who-are-the-players-)
    * [What are the Components of the LWAYVE Platform?](#what-are-the-components-of-the-lwayve-platform-)
    * [How Does LWAYVE Work?](#how-does-lwayve-work-)
  - [Section 2: Implementing the LWAYVE and ProxSee SDKs in an iOS Project](#section-2-implementing-the-lwayve-and-Proxsee-SDKs-in-an-ios-project)
    * [Prerequisites](#prerequisites)
    * [Add the LWAYVE and ProxSee SDKs as Dependencies](#add-the-lwayve-and-proxsee-sdks-as-dependencies)
    * [Configure Application Background Modes](#configure-application-background-modes)
    * [Initialize the LWAYVE and ProxSee SDKs](#initialize-the-lwayve-and-proxsee-sdks)
    * [Set Up Branded Playback Control](#set-up-branded-playback-control)
  - [Section 3: Testing LWAYVE](#section-3-testing-lwayve)
    * [Using API](#using-api)
    * [Setting Location](#setting-location)
    * [Setting User Likes](#setting-user-likes)
  - [Section 4: LWAYVE Event Handling Methods](#section-4-lwayve-event-handling)
    * [Generic SDK Events](#generic-sdk-events)
    * [Playback Events](#playback-events)
    * [Playlist Events](#playlist-events)
  - [Section 5: LWAYVE Control Methods](#section-5-lwayve-control-methods)
    * [Context Control](#context-control)
    * [Playback Control](#playback-control)
    * [Playlist Control](#playlist-control)
    * [Remote Notifications Control](#remote-notifications-control)
    * [SDK Settings Control](#sdk-settings-control)

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
- **Choreographed.** Contextual Audio Experiences are carefully choreographed and curated to ensure the highest quality audio experience for the event.
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

1. Add the LWAYVE and ProxSee SDKs as Dependencies
2. Configure Application Background Modes
3. Initialize the LWAYVE and ProxSee SDKs
4. Set Up an Event Logger

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
You can get the LWAYVE and ProxSee SDKs for iOS on Cocoapods:

- LWAYVE - [https://cocoapods.org/pods/LwayveSDK](https://cocoapods.org/pods/LwayveSDK)
- ProxSee - [https://cocoapods.org/pods/ProxSeeSDK](https://cocoapods.org/pods/ProxSeeSDK)

In order to add and manage the LWAYVE and ProxSee SDKs as dependencies in your iOS project, you must first install Cocoapods.

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
### Configure Application Background Modes

The following application background modes for the LWAYVE SDK must be configured:

- fetch: Allows your application to download content from the network.
- audio: Allows your application to play audio or stream audio/video using AirPlay.
- remote-notification: Allows your applications to download content in response to push notifications.

The following application background modes for the ProxSee SDK must be configured:

- location: Allows your application to register for location updates.
- privacy: A Location Always Usage Description should be specified.

To configure the above application modes in your application, add the following to your application plist:

```
<key>NSLocationAlwaysUsageDescription</key>
	<string>Location information is used to determine ProxSee tags.</string>
	<key>UIBackgroundModes</key>
	<array>
		<string>location</string>
		<string>fetch</string>
		<string>audio</string>
		<string>remote-notification</string>
	</array>

```

### Initialize the LWAYVE and ProxSee SDKs
The next step is to initialize (launch) both the LWAYVE SDK and the ProxSee SDK. 

#### Initialize the LWAYVE SDK
When initializing the LWAYVE SDK, you need to pass the Authentication token provided to you by Lixar.  

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

// Create the configuration used for the LWAYVE SDK.
let configuration = LwayveSDKConfiguration(baseURL: URL(string: settings.value(forSetting: .BaseURL)),
authenticationToken: settings.value(forSetting: .AuthenticationKey))

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
addProxSeeNotifcationObserver()

return true
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

## Step 3: Testing LWAYVE

### Using API

You can test LWAYVE by using the API documented on Swagger. You can access Swagger through the following URL: [https://gateway.lwayve.com/swagger-ui/index.html](https://gateway.lwayve.com/swagger-ui/index.html)

The following API is available:

- account-resource (Account Resource)
  - Get account
  - Change password
  - Finish password reset
  - Request password reset
  - Authorize
- application-resource (Application Resource)
  - Get applications
  - Create application
  - Get application by name
- customer-resource (Customer Resource)
  - Get all customers
  - Create customer
  - Update customer
- gateway-resource (Gateway Resource)
  - Active routes
- main-controller (Main Controller)
  - Redirect to Swagger with Stash
- profile-info-resource (Profile Info Resource)
  - Get active profiles
  - user-resource (User Resource)
  - Get all users
  - Create user
  - Delete user
  - Get user
  - Update user

### Setting Location
You can set location tags in LWAYVE using the following code:
```
LwayveSDK.sharedSDK.add(locations: ["#bar1", "#bar2"])

```

### Setting User Likes
You can set user likes in LWAYVE using the following code:

```
LwayveSDK.sharedSDK.add(userLikes: ["#Drinks", "#Danica", "#Johnson-Jimmie", "#Car43", "#Car45", "#Car50"])

```
## Section 4: LWAYVE Event Handling

The following section outlines the code to add to your application in order to handle the following events:

- Generic SDK Events
    - Initialize
    - De-Initialize
- Playlist Events
    - Update
- Playback Events
    - Playing
    - Paused
    - Ended
    - Error
    - Ready
    - Can Play
    - Can Skip
    - Can Rewind
 
### Generic SDK Events

The following methods are available for handling generic LWAYVE SDK events:

- Initialize
- De-Initialize

Add the following line of code to subscribe:

```
LwayveSDK.sharedSDK.delegate = self

```

To handle generic SDK events, the ```LwayveSDKDelegate``` protocol should be adopted. 

#### Initialize

This method is called when  the LWAYVE SDK has successfully initialized.

**Parameters**

- sdk: The LWAYVE SDK object.

```

func lwayveSDK(didInit sdk: LwayveSDK)

```

#### De-Initialize

This method is called when the LWAYVE SDK was de-initialized.

**Parameters**

- sdk: The LWAYVE SDK object.

```
func lwayveSDK(didDeinit sdk: LwayveSDK)

```

### Playlist Events

The following method is available for handling playlist events:

- Update

Add the following line of code to subscribe:

```
LwayveSDK.sharedSDK.playlistEventsListener = self

```
To handle playlist events, the ```PlayListEventsListener``` protocol should be adopted.

#### Update

This method is called each time the playlist has been updated. 

**Parameters**

- playlist: The object that contains the additional information about the updated playlist.

```
func playlistDidUpdate(_ playlist: Playlist)

```

### Playback Events

The following methods are available for handling playback events:

- Playing
- Paused
- Ended
- Error
- Can Play
- Can Skip
- Can Rewind


Add the following line of code to subscribe:

```
LwayveSDK.sharedSDK.add(audioControlDelegate: self)

```

To handle/receive playback events, the ```AudioControlDelegate``` protocol should be adopted. 

#### Playing

This method is called when the the audio track has started playing. 

**Parameters**

- track: The audio track that has started playing.

```

func lwayveSDK(didStartPlayingTrack track: AudioTrack)
 
```

#### Paused

This method is called when the audio track has been paused. 

**Parameters**

- track: The audio track that has been paused.


```
func lwayveSDK(didPauseTrack track: AudioTrack)

```

#### Ended

This method is called when the audio track has ended. 

**Parameters**

- track: The audio track that has ended.

```
func lwayveSDK(didEndPlayingTrack track: AudioTrack)

```

#### Error

This method is called when an audio track has failed to play and error has been thrown. 
**Parameters**

- Track: The audio track that failed to play.
- Error: The error object.

```
func lwayveSDK(didFailPlayingTracktrack: AudioTrack, withError error: NSError)

```
#### Can Play

This method is called when the audio player status has changed.

**Parameters**

- isReadyToPlay:  When ```true```, the audio player has audio tracks to play. When ```false```, the delegate should disable play controls.

```

func lwayveSDK(playerIsReadyToPlayStatusDidChange isReadyToPlay: Bool)

```

#### Can Skip

This method is called when the audio player status has changed.

**Parameters**

- canSkip: When ```true```, there is at least one audio track that has not finished playing. When ```false```, the delegate should disable the Skip button.

```

 func lwayveSDK(playerCanSkipStatusDidChange canSkip: Bool)

```

#### Can Rewind

This method is called when the audio player status has changed.

**Parameters**

- canRewind: When ```true```, the rewind action can be performed. When ```false```, the delegate should disable the Rewind button.

```
func lwayveSDK(playerCanRewindStatusDidChange canRewind: Bool)

```
## Section 5: LWAYVE Control Methods
Several methods have been made available to allow you to interact with LWAYVE. The methods available are divided into the following categories:

- Context Control
    - Update User Likes
    - Add User Likes
    - Remove User Likes
    - Update Locations
    - Add Locations
    - Remove Locations
    - Set Preferred Language
- Playback Control
    - Ready
    - Play
    - Is Playing
    - Pause
    - Stop
    - Skip
    - Rewind
    - Can Skip
    - Can Rewind
    - Add Listener
    - Remove Listener
- Playlist Control
    - Refresh
    - Reload
    - Get Playlist
    - Get Audio Tracks in Queue
    - Get Played Audio Tracks
    - Get Played Audio Track IDs
    - Clear Played Audio Tracks
- Remote Notifications Control
    - Initialize Remote Notifications
    - Handle Remote Notifications
    - State of Remote Notification Listening
- SDK Settings Control
    - Configure
    - Set Log Level
    - Get/Set Default Album Artwork Image


### Context Control
The following methods are available for updating the context of a Contextual Audio Experience. 

- Update User Likes
- Add User Likes
- Remove User Likes
- Update Locations
- Add Locations
- Remove Locations
- Set Preferred Language

To handle context, the ```ContextControlProtocol``` protocol should be adopted.

#### Update User Likes
Update user likes in a Contextual Audio Experience.

**Parameters**

- userLikes: The list of strings representing the updated user likes in the Contextual Audio Experience.

```
func set(userLikes: [String])

```

#### Add User Likes
Add user likes to a Contextual Audio Experience. 

**Parameters**

- userLikes: The list of strings representing the user likes to add to the Contextual Audio Experience.

```
func add(userLikes: [String])
```

#### Remove User Likes
Remove user likes from a Contextual Audio Experience.

**Parameters**

- userLikes: The list of strings representing the user likes to remove from the Contextual Audio Experience.
    
```
func remove(userLikes: [String])

```

#### Update Locations 
Update locations in a Contextual Audio Experience. 

**Parameters**

- locations: The list of strings representing the updated locations in the Contextual Audio Experience.

```
func set(locations: [String])

```
#### Add Locations
Add locations to a Contextual Audio Experience.

**Parameters**

- locations: The list of strings representing the locations to be added to the Contextual Audio Experience.

```
func add(locations: [String])

```

#### Remove Locations
Remove locations from a Contextual Audio Experience. 

**Parameters**

- locations: The list of strings representing the locations to be removed from the Contextual Audio Experience.
    
```
func remove(locations: [String])

```
#### Set Preferred Language

Get or update the SDK preferred language. Note that update action is an asynchronous operation. The default preferred language is the current device language (if supported by the LWAYVE SDK).

```
Public varlanguage: LwayveLanguage
```

### Playback Control
The following methods are available for controlling the playback. 

- Ready
- Play
- Is Playing
- Pause
- Stop
- Skip
- Rewind
- Can Skip
- Can Rewind
- Add Listener
- Remove Listener

To handle playback, the ```AudioPlaybackControlProtocol``` should be adopted.

#### Ready

Determine if the audio player is ready to play an audio track. If ```true``` is returned, the audio player is ready.

```
var isReadyToPlay: Bool { get }

```

#### Play 

Start playing queued audio tracks.
    
```
func play()

```

#### Is Playing

Indicates if the audio player is currently playing.

```
var isPlaying: Bool { get }

```

#### Pause
Pause the playback of the current audio track.
    
```
func pause()

```

#### Stop
End the playback of the current audio track and remove all audio tracks from the queue.

```
func stop()
```

#### Skip
End the playback of the current audio track and start the playback of the next audio track in the queue (if there is one).

```
func skip()

```
#### Rewind
Restart the current audio track from the beginning if it has played for greater than or equal to AudioPlaybackControlRestartThreshold seconds; otherwise, start playing the previous audio track (if any). If there is no previous audio track, start the current audio track from the beginning.

```
func rewind()

````

##### Can Skip

Determine if the skip action can be performed in the audio player. 

``` 
var canSkip: Bool { get }

```

##### Can Rewind

Determine it the rewind action can be performed in the audio player.

```
var canRewind: Bool { get }

```
#### Add Listener

Add a listener for audio playback events.

**Parameters**

- Delegate: An object conforming to the ```AudioControlDelegate``` protocol.

```
public func add(audioControlDelegate delegate: AudioControlDelegate)

```
#### Remove Listener

Remove a listener for audio playback events.

**Parameters**

- Delegate: An object conforming to the ```AudioControlDelegate``` protocol.

```
public func remove(audioControlDelegate delegate: AudioControlDelegate)

```

### Playlist Control
The following methods are available for controlling the Contextual Audio Experience playlist. 

- Refresh
- Reload
- Clear Played Audio Tracks
- Get Playlist
- Get Audio Tracks in Queue
- Get Played Audio Tracks
- Get Unplayed Audio Tracks
- Get Played Track IDs

To handle the playlist, the ```PlaylistControlProtocol``` should be adopted.

#### Refresh
Refresh the playlist based on the current context of playlist builder.

```
func refreshPlaylist()

```

#### Reload
Re-request the Contextual Audio Experience from the server.

```
func forceReloadExperience()

```

#### Clear Played Tracks

Clear the history of played audio tracks.

```
func clearPlayedItems()

```

#### Get Playlist

Get the list of items in the playlist. 

```

var generatedPlaylist: Playlist? { get }
```

#### Get Audio Tracks in Queue

Get the list of audio tracks in the queue, including the currently playing audio track (if any).

```
var audioQueue: [AudioTrack] { get }

```

#### Get Played Audio Tracks

Get the list of played audio tracks. The last audio track in the list is the most recently played one.

```
var playedTracksHistory: [AudioTrack] { get }

```
#### Get Unplayed Audio Tracks

Get the list of unplayed audio tracks. 

```
var unplayedTracksQueue: [AudioTrack] property

```

#### Get Played Audio Track IDs
Get the list of identifiers for the played audio tracks. 

```
var playedTracksIds: Set<String> { get }

```

### Remote Notifications Control

The following methods are available for handling application remote notifications.

- Initialize SDK for Handling Remote Notifications.
- Handle Remote Notifications
- State of Remote Notifications Listening

To support remote notifications, the ```ApplicationRemoteNotificationHandler``` protocol should be adopted.

#### Initialize SDK for Handling Remote Notifications

This method should be called in  ```-application:didFinishLaunchingWithOptions:``` of the delegate after the SDK has been initialized.

**Parameters**

- Application: The singleton application object passed through ```-application:didFinishLaunchingWithOptions```.
- launchOptions: A dictionary indicating the reason the app was launched (if any)_ passed through ```-application:didFinishLaunchingWithOptions```.

```
func handleApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)

```
#### Handle Remote Notifications

This method should be called in ```-application:didReceiveRemoteNotification:``` of ```-application:didReceiveRemoteNotification:fetchCompletionHandler``` to handle remote notifications. 

**Parameters**

- Application: The singleton app object.
- userInfo: A dictionary that contains information related to the remote notification.

```
func handleApplication(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any])

```
#### State of Remote Notifications Listening

Indicates the state of remote notifications listening. Set to ```false``` to stop receiving remote notifications.

```
var notificationsActive: Bool { get set }

```

### SDK Settings Control

The following methods are available for controlling SDK settings.

- Configure
- Set Log Level
- Get/Set Default Album Artwork Image

#### Configure

Call this method before using the LWAYVE SDK.

**Parameters**

- configuration: The configuration object.

```
public func initialize(configuration: LwayveSDKConfiguration) throws

public func deinitialize()

static public let sharedSDK: LwayveSDK.LwayveSDK

public func add(audioControlDelegate delegate: AudioControlDelegate

public func remove(audioControlDelegate delegate: AudioControlDelegate

public weak var playlistEventsListener: PlayListEventsListener?

public weak var delegate: LwayveSDKDelegate?

```

#### Set Log Level

Set the logger for a specific level and component.

**Parameters**

- Level: The log level
- Components: the log components

```
public func setLogLevel(_ level: LwayveSDKLogLevel, components: [LwayveSDKLogComponent]) 


```


#### Get/Set Default Album Artwork Image

Get/set the default album artwork image that is displayed in the iOS Control Center and on the iOS Lock screen if a track-specific image is not provided.  Note that the default image should be square. 

```
Var defaultAlbumArtworkImage: UIImage? { get set }

```









