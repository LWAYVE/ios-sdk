//
//  LXMetadataManagerProxy.h
//  LwayveSDK
//
//  Created by Jamie Wutke on 2017-12-12.
//  Copyright © 2017 Lixar. All rights reserved.
//

#import <LwayveSDK/LwayveWeakLinkingWrapper.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LXMetadataManagerProxyProtocol

@optional

- (void)updateMetadata:(NSDictionary *)object completionHandler:(void (^)(BOOL success, NSError *error))completionHandler;

@end

@interface LXMetadataManagerProxy : LwayveWeakLinkingWrapper <LXMetadataManagerProxyProtocol>

@end

NS_ASSUME_NONNULL_END

