//
//  LXProxSeeNotificationObjectProxy.h
//  LwayveSDK+ProxSee
//
//  Created by Maksym Malyhin on 2017-11-09.
//  Copyright © 2017 Lixar. All rights reserved.
//

@import Foundation;

@protocol LXProxSeeTagsChangeSetProxy <NSObject>

@property (nonatomic, strong, readonly) NSSet<NSString *> *tags;
@property (nonatomic, strong, readonly) NSDate *lastSeen;

@end

@protocol LXProxSeeNotificationObjectProxy <NSObject>

@property (nonatomic, strong, readonly) id<LXProxSeeTagsChangeSetProxy> previousTagsChangeSet;
@property (nonatomic, strong, readonly) id<LXProxSeeTagsChangeSetProxy> currentTagsChangeSet;

@end
