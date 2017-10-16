//
//  LwayveWeakLinkingWrapperFirebaseApp.h
//  LwayveSDK
//
//  Created by Maksym Malyhin on 2017-06-21.
//  Copyright © 2017 Lixar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(FirebaseAppWrapper)
@interface LwayveWeakLinkingWrapperFirebaseApp : NSProxy

+ (void)configureWithOptions:(nullable id)options NS_SWIFT_NAME(configure(options:));
+ (nullable LwayveWeakLinkingWrapperFirebaseApp *)defaultApp NS_SWIFT_NAME(app());

- (void)deleteApp:(nonnull void (^)(BOOL))completion NS_SWIFT_NAME(delete(_:));

@end
