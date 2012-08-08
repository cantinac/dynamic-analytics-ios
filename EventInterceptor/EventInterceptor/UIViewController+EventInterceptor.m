//
//  UIViewController+EventInterceptor.m
//  EventInterceptor
//
//  Created by David Fox on 8/6/12.
//  Copyright (c) 2012 David Fox. All rights reserved.
//

#import "UIViewController+EventInterceptor.h"
#import "EventLogger.h"
#import <objc/runtime.h>

@implementation UIViewController (EventInterceptor)

+(void) load
{
    //Replace the noop viewDidAppear with our own implementation
    class_replaceMethod(self, @selector(viewDidAppear:), (IMP) viewDidAppear, "v@:@");
}

void viewDidAppear(id self, SEL _cmd, BOOL animated)
{
    [EventLogger logEvent:EVENT_LOGGER_APPEARED forObject:[self view]];
}

@end
