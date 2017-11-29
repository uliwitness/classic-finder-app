//
//  CCIScrollbarScroller.h
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/12/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSUInteger, ScrollerDirection) {
    ScrollerVertical,
    ScrollerHorizontal
};

@interface CCIScrollbarScroller : NSControl

@property (nonatomic) BOOL scrollerClicked;

+ (instancetype)scrollerBoxAtPoint:(NSPoint)point
                withDirectionality:(ScrollerDirection)direction;

- (void)moveScrollerBoxToPoint:(NSPoint)point;

@end
