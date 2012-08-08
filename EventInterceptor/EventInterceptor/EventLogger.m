//
//  EventLogger.m
//  EventInterceptor
//
//  Created by David Fox on 8/6/12.
//  Copyright (c) 2012 David Fox. All rights reserved.
//

#import "EventLogger.h"

NSString *const EVENT_LOGGER_APPEARED = @"appeared";
NSString *const EVENT_LOGGER_TOUCHED = @"touched";

@implementation EventLogger

+(void)logEvent:(NSString *)type forObject:(NSObject *)object
{
    if ([object respondsToSelector:@selector(eventValue)]
        && [object respondsToSelector:@selector(eventType)]){
        
        NSString *eventValue = [object performSelector:@selector(eventValue)];
        NSString *eventType = [object performSelector:@selector(eventType)];
        
        if (eventValue != nil && (eventType == nil || [type isEqualToString:eventType])){
            
            if ([EVENT_LOGGER_APPEARED isEqualToString:eventType]){
                //[[LocalyticsSession sharedLocalyticsSession] tagEvent:eventValue];
            }
            else if ([EVENT_LOGGER_TOUCHED isEqualToString:eventType]){
                //[[LocalyticsSession sharedLocalyticsSession] tagScreen:eventValue];
            }
            
            NSLog(@"Event: %@: %@", eventType, eventValue);
        }
    }
}

@end
