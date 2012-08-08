//
//  UIApplication+EventInterceptor.m
//  EventInterceptor
//
//  Created by David Fox on 8/2/12.
//  Copyright (c) 2012 David Fox. All rights reserved.
//

#import "UIApplication+EventInterceptor.h"
#import <objc/runtime.h>
#import "EventLogger.h"

@implementation UIApplication (EventInterceptor)

+(void) load
{
    //Swap the implementations of our interceptor and the original sendEvent:
    Method oldMethod = class_getInstanceMethod(self, @selector(sendEvent:));
    Method newMethod = class_getInstanceMethod(self, @selector(interceptAndSendEvent:));
    method_exchangeImplementations(oldMethod, newMethod);
}

-(void) interceptAndSendEvent: (UIEvent *) event
{
    for (UITouch *touch in event.allTouches){
        if (touch.phase == UITouchPhaseBegan){
            [EventLogger logEvent:EVENT_LOGGER_TOUCHED forObject:touch.view];
        }
    }
    [self interceptAndSendEvent:event];
}

@end
