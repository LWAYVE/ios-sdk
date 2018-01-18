//
//  LXProxSeeNotificationObjectProxy.h
//  LwayveSDK+ProxSee
//
//  Created by Maksym Malyhin on 2017-11-09.
//  Copyright © 2017 Lixar. All rights reserved.
//

@import Foundation;

@protocol LXTagsChangeSetProxyProtocol <NSObject>

@property (nonatomic, strong, readonly) NSSet<NSString *> *tags;
@property (nonatomic, strong, readonly) NSDate *lastSeen;

@end

@protocol LXTagsProxyProtocol <NSObject>

@property (nonatomic, strong, readonly) id<LXTagsChangeSetProxyProtocol> previousTagsChangeSet;
@property (nonatomic, strong, readonly) id<LXTagsChangeSetProxyProtocol> currentTagsChangeSet;

@end
