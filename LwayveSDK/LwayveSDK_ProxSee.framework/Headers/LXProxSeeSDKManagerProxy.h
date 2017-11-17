//
//  LXProxSeeSDKManagerProxy.h
//  LwayveSDK+ProxSee
//
//  Created by Maksym Malyhin on 2017-11-09.
//  Copyright © 2017 Lixar. All rights reserved.
//

#import <LwayveSDK/LwayveSDK.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LXProxSeeSDKManagerProxyProtocol

+ (nullable id<LXProxSeeSDKManagerProxyProtocol>)sharedInstance;

+ (void)launchProxSeeWithApiKey:(NSString *)apiKey;

@optional

- (void)updateMetadata:(NSDictionary *)object completionHandler:(void (^)(BOOL success, NSError *error))completionHandler;

@property (nonatomic) BOOL isMonitoringEnabled;

- (void)fetchDetectedBeaconsWithCompletionHandler:(void (^)(NSArray<NSString *> *tags))completionHandler;

@end

@interface LXProxSeeSDKManagerProxy : LwayveWeakLinkingWrapper <LXProxSeeSDKManagerProxyProtocol>

- (nullable instancetype)init;

@end

NS_ASSUME_NONNULL_END
