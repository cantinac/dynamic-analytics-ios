//
//  UIResponder+EventInterceptor.h
//  EventInterceptor
//
//  Created by David Fox on 8/7/12.
//  Copyright (c) 2012 David Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (EventInterceptor)

@property NSString *eventType;
@property NSString *eventValue;

@end
