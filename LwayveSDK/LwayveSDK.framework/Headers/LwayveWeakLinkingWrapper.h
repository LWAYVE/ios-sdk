//
//  LwayveWeakLinkingWrapper.h
//  LwayveSDK
//
//  Created by Maksym Malyhin on 2017-06-21.
//  Copyright © 2017 Lixar. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface LwayveWeakLinkingWrapper : NSProxy

@property(nonatomic, nonnull, readonly) id targetObject;

- (instancetype)initWithTargetObject:(id)object;

/// Should be overriten by subclass. Default - `return NO`
+ (BOOL)respondsToSelector:(SEL)aSelector;

@end

NS_ASSUME_NONNULL_END
