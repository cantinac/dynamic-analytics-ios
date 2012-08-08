//
//  EventLogger.h
//  EventInterceptor
//
//  Created by David Fox on 8/6/12.
//  Copyright (c) 2012 David Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const EVENT_LOGGER_APPEARED;
FOUNDATION_EXPORT NSString *const EVENT_LOGGER_TOUCHED;

@interface EventLogger : NSObject

+(void)logEvent:(NSString *)type forObject:(NSObject *)object;

@end
