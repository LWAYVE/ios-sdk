//
//  NSObject+NSObject_LXProxSeeNotificationObserverProxy.h
//  LwayveSDK+ProxSee
//
//  Created by Maksym Malyhin on 2017-11-09.
//  Copyright © 2017 Lixar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LXProxSeeNotificationObserverProxy)

- (void)lwayve_addProxSeeNotifcationObserver;
- (void)lwayve_removeProxSeeNotificationObserver;

@end
