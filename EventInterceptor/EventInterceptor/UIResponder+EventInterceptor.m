//
//  UIResponder+EventInterceptor.m
//  EventInterceptor
//
//  Created by David Fox on 8/7/12.
//  Copyright (c) 2012 David Fox. All rights reserved.
//

#import "UIResponder+EventInterceptor.h"
#import <objc/runtime.h>

const char *ASSOC_OBJECT_EVENT_TYPE = "eventType";
const char *ASSOC_OBJECT_EVENT_VALUE = "eventValue";

@implementation UIResponder (EventInterceptor)

-(void) setEventValue:(NSString *)eventValue
{
    objc_setAssociatedObject (self, ASSOC_OBJECT_EVENT_VALUE, eventValue, OBJC_ASSOCIATION_RETAIN);
}

-(NSString *) eventValue
{
    return (NSString *) objc_getAssociatedObject(self, ASSOC_OBJECT_EVENT_VALUE);
}

-(void) setEventType:(NSString *)eventType
{
    objc_setAssociatedObject (self, ASSOC_OBJECT_EVENT_TYPE, eventType, OBJC_ASSOCIATION_RETAIN);
}

-(NSString *) eventType
{
    return (NSString *) objc_getAssociatedObject(self, ASSOC_OBJECT_EVENT_TYPE);
}

@end
