//
//  CCICloseButton.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CCICloseButton.h"
#import "CCIClassicFinderWindow.h"
#import "CFRWindowManager.h"

@interface CCICloseButton ()

@property BOOL isClicked;

@end

@implementation CCICloseButton

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    [NSGraphicsContext saveGraphicsState];
    
    [[NSColor colorWithCalibratedWhite:0.92
                                 alpha:1.0] setFill];
    NSRectFill(NSMakeRect(0.0, 0.0, 13.0, 11.0));
    
    [[NSColor colorWithCalibratedRed:0.15
                               green:0.14
                                blue:0.31
                               alpha:1.0] setFill];
    NSRectFill(NSMakeRect(1.0, 0.0, 11.0, 11.0));
    
    if (self.isClicked) {
        [[NSColor colorWithCalibratedRed:0.70
                                   green:0.70
                                    blue:0.96
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(2.0, 0.0, 10.0, 10.0));
        
        [[NSColor colorWithCalibratedRed:0.14
                                   green:0.13
                                    blue:0.30
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3.0, 1.0, 8.0, 8.0));
        
        [[NSColor colorWithCalibratedWhite:0.45
                                     alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3.0, 2.0, 7.0, 7.0));
    } else {
        [[NSColor colorWithCalibratedRed:0.76
                                   green:0.76
                                    blue:1.0
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(2.0, 0.0, 10.0, 10.0));
        
        [[NSColor colorWithCalibratedRed:0.15
                                   green:0.14
                                    blue:0.31
                                   alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3.0, 1.0, 8.0, 8.0));
        
        [[NSColor colorWithCalibratedWhite:0.58
                                     alpha:1.0] setFill];
        NSRectFill(NSMakeRect(3.0, 2.0, 7.0, 7.0));
    }
    
    [NSGraphicsContext restoreGraphicsState];
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

    [event.window close];
}

- (void)mouseDragged:(NSEvent *)event {}

@end
