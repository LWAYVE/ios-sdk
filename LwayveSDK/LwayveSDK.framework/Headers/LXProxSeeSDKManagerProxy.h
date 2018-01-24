//
//  LXProxSeeSDKManagerProxy.h
//  LwayveSDK+ProxSee
//
//  Created by Maksym Malyhin on 2017-11-09.
//  Copyright © 2017 Lixar. All rights reserved.
//

#import <LwayveSDK/LwayveWeakLinkingWrapper.h>
#import <LwayveSDK/LXTagsManagerProxy.h>
#import <LwayveSDK/LXMetadataManagerProxy.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LXProxSeeSDKManagerProxyProtocol

+ (nullable id<LXProxSeeSDKManagerProxyProtocol>)sharedInstance;

+ (void)initializeWithApiKey:(NSString *)apiKey;

- (nullable id<LXTagsManagerProxyProtocol>)tagsManager;

- (nullable id<LXMetadataManagerProxyProtocol>)metadataManager;

@optional

- (void)enable;

- (void)disable;

@property (nonatomic, readonly) BOOL isEnabled;

@end

@interface LXProxSeeSDKManagerProxy : LwayveWeakLinkingWrapper <LXProxSeeSDKManagerProxyProtocol>

- (nullable instancetype)init;

@end

NS_ASSUME_NONNULL_END
