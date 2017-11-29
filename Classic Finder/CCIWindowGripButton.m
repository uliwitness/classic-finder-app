//
//  CCIWindowGripButton.m
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/23/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import "CCIWindowGripButton.h"

@interface CCIWindowGripButton()

@property (nonatomic) BOOL isClicked;
@property (nonatomic) BOOL inactive;

@end

@implementation CCIWindowGripButton

#pragma mark - INITIALIZATION METHODS

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        [self setIsClicked:NO];
        [self setInactive:NO];
    }
    
    return self;
}

#pragma mark - DRAWING METHODS

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    if (self.inactive) {
        [[NSColor colorWithWhite:1.0
                           alpha:1.0] setFill];
        
        NSRect backgroundRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        NSRectFill(backgroundRect);
    } else {
        [[NSColor colorWithWhite:0.92
                           alpha:1.0] setFill];
        
        NSRect backgroundRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        NSRectFill(backgroundRect);
        
        [[NSColor colorWithCalibratedRed:0.15
                                   green:0.14
                                    blue:0.31
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3.0, 3.0, 8.0, 8.0));
        
        [[NSColor colorWithCalibratedRed:0.76
                                   green:0.76
                                    blue:1.0
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(4.0, 4.0, 7.0, 7.0));
        
        [[NSColor colorWithCalibratedRed:0.15
                                   green:0.14
                                    blue:0.31
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(5.0, 5.0, 6.0, 6.0));
        
        [[NSColor colorWithCalibratedWhite:0.58
                                     alpha:1.0] setFill];
        NSRectFill(NSMakeRect(5.0, 5.0, 5.0, 5.0));
        
        //small suqare
        [[NSColor colorWithCalibratedRed:0.15
                                   green:0.14
                                    blue:0.31
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(2.0, 2.0, 5.0, 5.0));
        
        [[NSColor colorWithCalibratedRed:0.76
                                   green:0.76
                                    blue:1.0
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3.0, 3.0, 4.0, 4.0));
        
        [[NSColor colorWithCalibratedRed:0.15
                                   green:0.14
                                    blue:0.31
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(4.0, 4.0, 3.0, 3.0));
        
        [[NSColor colorWithCalibratedRed:0.73
                                   green:0.73
                                    blue:0.73
                                   alpha:1.00] setFill];
        NSRectFill(NSMakeRect(4.0, 4.0, 2.0, 2.0));
    }
}

- (BOOL)isFlipped
{
    return YES;
}

@end
