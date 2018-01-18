//
//  LXTagsManagerProxy.h
//  LwayveSDK
//
//  Created by Jamie Wutke on 2017-12-11.
//  Copyright © 2017 Lixar. All rights reserved.
//

#import <LwayveSDK/LwayveWeakLinkingWrapper.h>
#import <LwayveSDK/LXTagsProxy.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LXTagsReceiverProxyProtocol

@optional

- (void)didChangeTagsSet:(id<LXTagsProxyProtocol>)tags;

@end

@protocol LXTagsManagerProxyProtocol

@optional

- (void)registerReceiver:(id<LXTagsReceiverProxyProtocol>)handler;

- (void)unregisterReceiver:(id<LXTagsReceiverProxyProtocol>)handler;

- (void)getDetectedTagsWithCompletionHandler:(void (^)(id<LXTagsChangeSetProxyProtocol> changeSet))completionHandler;

@end

@interface LXTagsManagerProxy : LwayveWeakLinkingWrapper <LXTagsManagerProxyProtocol>

@end

NS_ASSUME_NONNULL_END
