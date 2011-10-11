//
//  ATToolbar.m
//  CustomWindow
//
//  Created by Andrew Wooster on 9/24/11.
//  Copyright 2011 Apptentive, Inc. All rights reserved.
//

#import "ATToolbar.h"

@implementation ATToolbar

//!! Hack to adjust frame origin of left-most custom view.
//!! This is a huge hack.
- (void)layoutSubviews {
	[super layoutSubviews];
	NSArray *items = [self items];
	if ([items count] > 0) {
		UIBarButtonItem *firstItem = [items objectAtIndex:0];
		BOOL adjustedFirstItem = NO;
		if (firstItem.customView != nil) {
			CGRect f = firstItem.customView.frame;
			if (f.origin.x == 12.0) {
				f.origin.x = 6.0;
				firstItem.customView.frame = f;
				adjustedFirstItem = YES;
			}
		}
		
		if (adjustedFirstItem) {
			NSUInteger i = 0;
			for (UIBarButtonItem *item in items) {
				if (i != 0 && item.customView) {
					CGRect customFrame = item.customView.frame;
					customFrame.origin.x -= 3.0;
					item.customView.frame = customFrame;
				}
				i++;
			}
		}
	}
}

- (void)drawRect:(CGRect)rect {
	//
}

@end
