//
//  LwayveLumberjackLogger.h
//  LwayveSDK
//
//  Created by Maksym Malyhin on 2017-07-06.
//  Copyright © 2017 Lixar. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Enumeration of log levels
///
/// - off: No log (default value)
/// - error: Only error logs
/// - _warning: Warning and Error logs
/// - info: Info, Warnings and Error logs
/// - debug: Debug, Info, Warning and Error logs
/// - verbose: Verbose, Debug, Info, Warning and Error logs
/// - all: All log levels
typedef NS_ENUM(NSUInteger, LwayveSDKLogLevel) {
    LwayveSDKLogLevelOff,
    LwayveSDKLogLevelError,
    LwayveSDKLogLevelWarning,
    LwayveSDKLogLevelInfo,
    LwayveSDKLogLevelDebug,
    LwayveSDKLogLevelVerbose,
    LwayveSDKLogLevelAll
};

@interface LwayveLumberjackLogger : NSObject

- (void)setLogLevel:(LwayveSDKLogLevel)logLevel;
- (void)logMesssage:(NSString *)message withLogLevel:(LwayveSDKLogLevel)logLevel;

@end
