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

+ (void)configureWithOptions:(id)options NS_SWIFT_NAME(configure(options:));

@end
