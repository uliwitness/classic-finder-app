//
//  CCIMaximizeButton.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CCIMaximizeButton.h"

@interface CCIMaximizeButton ()

@property BOOL isClicked;

@end

@implementation CCIMaximizeButton

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    [[NSColor colorWithCalibratedWhite:0.92
                                 alpha:1.0] setFill];
    NSRectFill(NSMakeRect(0, 0, 13, 11));
    
    [[NSColor colorWithCalibratedRed:0.15
                               green:0.14
                                blue:0.31
                               alpha:1.0] setFill];
    NSRectFill(NSMakeRect(1, 0, 11, 11));
    
    if (self.isClicked) {
        [[NSColor colorWithCalibratedRed:0.70
                                   green:0.70
                                    blue:0.96
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(2, 0, 10, 10));
        
        [[NSColor colorWithCalibratedRed:0.14
                                   green:0.13
                                    blue:0.30
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3, 1, 8, 8));
        
        [[NSColor colorWithCalibratedWhite:0.45
                                     alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3, 2, 7, 7));
        
        [[NSColor colorWithCalibratedRed:0.14
                                   green:0.13
                                    blue:0.30
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3, 4, 5, 5));
        
        [[NSColor colorWithCalibratedWhite:0.45
                                     alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3, 5, 4, 4));
    } else {
        [[NSColor colorWithCalibratedRed:0.76
                                   green:0.76
                                    blue:1.0
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(2, 0, 10, 10));
        
        [[NSColor colorWithCalibratedRed:0.15
                                   green:0.14
                                    blue:0.31
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3, 1, 8, 8));
        
        [[NSColor colorWithCalibratedWhite:0.58
                                     alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3, 2, 7, 7));
        
        [[NSColor colorWithCalibratedRed:0.15
                                   green:0.14
                                    blue:0.31
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3, 4, 5, 5));
        
        [[NSColor colorWithCalibratedWhite:0.58
                                     alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3, 5, 4, 4));
    }
}

- (void)mouseDown:(NSEvent *)event
{
    self.isClicked = YES;
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)event
{
    self.isClicked = NO;
    [self setNeedsDisplay:YES];
}

- (void)mouseDragged:(NSEvent *)event {}

@end