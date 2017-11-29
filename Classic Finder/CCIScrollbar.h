//
//  CCIScrollbar.h
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/12/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CCIScrollView;

typedef NS_ENUM(NSUInteger, ScrollDirection) {
    Horizontal,
    Vertical
};

@interface CCIScrollbar : NSControl

+ (CCIScrollbar *)horizontalScrollbarForScrollView:(CCIScrollView *)scrollView
                                withMaxContentSize:(CGFloat)maxContentSize;
+ (CCIScrollbar *)verticalScrollbarForScrollView:(CCIScrollView *)scrollView
                              withMaxContentSize:(CGFloat)maxContentSize;
- (void)setScrollerYPosition:(CGFloat)yPOS;
- (void)setScrollerXPosition:(CGFloat)xPOS;
@end
