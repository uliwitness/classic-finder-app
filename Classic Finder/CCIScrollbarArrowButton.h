//
//  CCIScrollbarArrowButton.h
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/12/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CCIScrollbar;

typedef NS_ENUM(NSUInteger, ButtonDirectionality) {
    Up,
    Right,
    Down,
    Left
};

@interface CCIScrollbarArrowButton : NSControl

@property ButtonDirectionality direction;

+ (CCIScrollbarArrowButton *)buttonWithDirectionality:(ButtonDirectionality)direction
                                        atPoint:(NSPoint) point
                            withParentScrollbar:(CCIScrollbar *)scrollBar;

@end
