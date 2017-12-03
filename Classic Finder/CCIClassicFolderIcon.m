//
//  ClassicFolderIcon.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/19/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import "CCIClassicFolderIcon.h"

@interface CCIClassicFolderIcon ()

@property BOOL selectedState;

@end

@implementation CCIClassicFolderIcon

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        self.selectedState = NO;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if (self.selectedState) {
        [[NSColor blackColor] setStroke];
        [[NSColor colorWithCalibratedRed:0.15
                                   green:0.13
                                    blue:0.41
                                   alpha:1.0] setFill];
        
        NSBezierPath *outlinePath = [[NSBezierPath alloc] init];
        [outlinePath moveToPoint:NSMakePoint(30.0, 5.0)];
        [outlinePath lineToPoint:NSMakePoint(30.0, 24.0)];
        [outlinePath lineToPoint:NSMakePoint(0.5, 24.0)];
        [outlinePath lineToPoint:NSMakePoint(0.5, 5.0)];
        [outlinePath lineToPoint:NSMakePoint(5.0, 1.0)];
        [outlinePath lineToPoint:NSMakePoint(11.0, 1.0)];
        [outlinePath lineToPoint:NSMakePoint(15.0, 4.5)];
        [outlinePath lineToPoint:NSMakePoint(29.0, 4.5)];
        [outlinePath stroke];
        [outlinePath fill];
        
        [[NSColor colorWithCalibratedRed:0.10
                                   green:0.07
                                    blue:0.41
                                   alpha:1.0] setStroke];
        
        NSBezierPath *shadowPath = [[NSBezierPath alloc] init];
        [shadowPath moveToPoint:NSMakePoint(29.5, 7.0)];
        [shadowPath lineToPoint:NSMakePoint(29.5, 24.0)];
        [shadowPath stroke];
        
        [[NSColor colorWithCalibratedRed:0.41
                                   green:0.41
                                    blue:0.41
                                   alpha:1.0] setStroke];
        
        [[NSColor colorWithCalibratedRed:0.41
                                   green:0.41
                                    blue:0.41
                                   alpha:1.0] setStroke];
        
        NSBezierPath *highlightPath = [[NSBezierPath alloc] init];
        [highlightPath moveToPoint:NSMakePoint(1.0, 6.5)];
        [highlightPath lineToPoint:NSMakePoint(30.0, 6.5)];
        [highlightPath stroke];
        
        for (NSUInteger row = 7; row < 23; row++) {
            for (NSUInteger col = 1; col < 29; col++) {
                if (row % 2 == 0) {
                    if (col % 2 == 0) {
                        NSRectFill(NSMakeRect(col, row, 1.0, 1.0));
                    }
                } else {
                    if (col % 2 == 1) {
                        NSRectFill(NSMakeRect(col, row, 1.0, 1.0));
                    }
                }
            }
        }
    } else {
        [[NSColor blackColor] setStroke];
        [[NSColor colorWithCalibratedRed:0.76
                                   green:0.75
                                    blue:1.0
                                   alpha:1.0] setFill];
        
        NSBezierPath *outlinePath = [[NSBezierPath alloc] init];
        [outlinePath moveToPoint:NSMakePoint(30.0, 5.0)];
        [outlinePath lineToPoint:NSMakePoint(30.0, 24.0)];
        [outlinePath lineToPoint:NSMakePoint(0.5, 24.0)];
        [outlinePath lineToPoint:NSMakePoint(0.5, 5.0)];
        [outlinePath lineToPoint:NSMakePoint(5.0, 1.0)];
        [outlinePath lineToPoint:NSMakePoint(11.0, 1.0)];
        [outlinePath lineToPoint:NSMakePoint(15.0, 4.5)];
        [outlinePath lineToPoint:NSMakePoint(29.0, 4.5)];
        [outlinePath stroke];
        [outlinePath fill];
        
        [[NSColor colorWithCalibratedRed:0.53
                                   green:0.51
                                    blue:1.0
                                   alpha:1.0] setStroke];
        
        NSBezierPath *shadowPath = [[NSBezierPath alloc] init];
        [shadowPath moveToPoint:NSMakePoint(29.5, 7.0)];
        [shadowPath lineToPoint:NSMakePoint(29.5, 24.0)];
        [shadowPath stroke];
        
        
        [[NSColor colorWithCalibratedWhite:1.0
                                     alpha:1.0] setStroke];
        
        NSBezierPath *highlightPath = [[NSBezierPath alloc] init];
        [highlightPath moveToPoint:NSMakePoint(1.0, 6.5)];
        [highlightPath lineToPoint:NSMakePoint(30.0, 6.5)];
        [highlightPath stroke];
        
        [[NSColor colorWithCalibratedWhite:1.0
                                     alpha:1.0] setFill];
        
        for (NSUInteger row = 7; row < 23; row++) {
            for (NSUInteger col = 1; col < 29; col++) {
                if (row % 2 == 0) {
                    if (col % 2 == 0) {
                        NSRectFill(NSMakeRect(col, row, 1.0, 1.0));
                    }
                } else {
                    if (col % 2 == 1) {
                        NSRectFill(NSMakeRect(col, row, 1.0, 1.0));
                    }
                }
            }
        }
    }
}

- (BOOL)isFlipped
{
    return YES;
}

- (void)selectFolder
{
    self.selectedState = YES;
    [self setNeedsDisplay:YES];
}

- (void)unselectFolder
{
    self.selectedState = NO;
    [self setNeedsDisplay:YES];
}

@end
