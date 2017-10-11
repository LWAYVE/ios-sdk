//
//  LwayveWeakLinkingWrapperMessaging.h
//  LwayveSDK
//
//  Created by Maksym Malyhin on 2017-06-21.
//  Copyright © 2017 Lixar. All rights reserved.
//

@import Foundation;

@class LwayveWeakLinkingWrapperMessagingRemoteMessage;

NS_ASSUME_NONNULL_BEGIN

/**
 * A protocol to handle events from FCM for devices running iOS 10 or above.
 *
 * To support devices running iOS 9 or below, use the local and remote notifications handlers
 * defined in UIApplicationDelegate protocol.
 */
NS_SWIFT_NAME(LwayveMessagingDelegate)
@protocol LwayveWeakLinkingWrapperMessagingDelegate <NSObject>

/// This method will be called whenever FCM receives a new, default FCM token for your
/// Firebase project's Sender ID.
/// You can send this token to your application server to send notifications to this device.
- (void)messaging:(nonnull LwayveWeakLinkingWrapper *)messaging
didRefreshRegistrationToken:(nonnull NSString *)fcmToken
NS_SWIFT_NAME(messaging(_:didRefreshRegistrationToken:));

@optional
/// This method is called on iOS 10 devices to handle data messages received via FCM through its
/// direct channel (not via APNS). For iOS 9 and below, the FCM data message is delivered via the
/// UIApplicationDelegate's -application:didReceiveRemoteNotification: method.
- (void)messaging:(nonnull LwayveWeakLinkingWrapper *)messaging
didReceiveMessageWithAppData:(nonnull NSDictionary *)appData
NS_SWIFT_NAME(messaging(_:didReceive:))
__IOS_AVAILABLE(10.0);

@end

typedef void(^LwayveMessagingFCMTokenFetchCompletion)(NSString * _Nullable FCMToken,
                                                      NSError * _Nullable error)
NS_SWIFT_NAME(MessagingFCMTokenFetchCompletion);

@protocol LwayveWeakLinkingWrapperMessagingProtocol <NSObject>

/**
 *  When set to YES, Firebase Messaging will automatically establish a socket-based, direct channel
 *  to the FCM server. You only need to enable this if you are sending upstream messages or
 *  receiving non-APNS, data-only messages in foregrounded apps.
 *  Default is NO.
 */
@property(nonatomic) BOOL shouldEstablishDirectChannel;

/**
 *  The FCM token is used to identify this device so that FCM can send notifications to it.
 *  It is associated with your APNS token when the APNS token is supplied, so that sending
 *  messages to the FCM token will be delivered over APNS.
 *
 *  The FCM token is sometimes refreshed automatically. You can be notified of these changes
 *  via the FIRMessagingDelegate method `-message:didRefreshRegistrationToken:`, or by
 *  listening for the `FIRMessagingRegistrationTokenRefreshedNotification` notification.
 *
 *  Once you have an FCM token, you should send it to your application server, so it can use
 *  the FCM token to send notifications to your device.
 */
@property(nonatomic, readonly, nullable) NSString *FCMToken NS_SWIFT_NAME(fcmToken);

@property(nonatomic, copy, nullable) NSData *APNSToken NS_SWIFT_NAME(apnsToken);

#pragma mark - Topics

/**
 *  Asynchronously subscribes to a topic.
 *
 *  @param topic The name of the topic, for example, @"sports".
 */
- (void)subscribeToTopic:(nonnull NSString *)topic NS_SWIFT_NAME(subscribe(toTopic:));

/**
 *  Asynchronously unsubscribe from a topic.
 *
 *  @param topic The name of the topic, for example @"sports".
 */
- (void)unsubscribeFromTopic:(nonnull NSString *)topic NS_SWIFT_NAME(unsubscribe(fromTopic:));

/**
 * Delegate to handle FCM token refreshes, and remote data messages received via FCM for devices
 * running iOS 10 or above.
 */
@property(nonatomic, weak, nullable) id<LwayveWeakLinkingWrapperMessagingDelegate> delegate;

/**
 *  Retrieves an FCM registration token for a particular Sender ID. This registration token is
 *  not cached by FIRMessaging. FIRMessaging should have an APNS token set before calling this
 *  to ensure that notifications can be delivered via APNS using this FCM token. You may
 *  re-retrieve the FCM token once you have the APNS token set, to associate it with the FCM
 *  token. The default FCM token is automatically associated with the APNS token, if the APNS
 *  token data is available.
 *
 *  @param senderID The Sender ID for a particular Firebase project.
 *  @param completion The completion handler to handle the token request.
 */
- (void)retrieveFCMTokenForSenderID:(nonnull NSString *)senderID
                         completion:(nonnull LwayveMessagingFCMTokenFetchCompletion)completion
NS_SWIFT_NAME(retrieveFCMToken(forSenderID:completion:));

@end

NS_SWIFT_NAME(FirebaseMessagingWrapper)
@interface LwayveWeakLinkingWrapperMessaging : LwayveWeakLinkingWrapper <LwayveWeakLinkingWrapperMessagingProtocol>

- (nullable instancetype)init;

+ (nonnull instancetype)messaging NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
