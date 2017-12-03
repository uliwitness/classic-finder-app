//
//  ClassicFolderIcon.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/19/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//
//
// This file is part of Classic Finder.
//
// Classic Finder is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Classic Finder is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Classic Finder.  If not, see <http://www.gnu.org/licenses/>.

#import "CCIClassicFolderIcon.h"
#import "CCIApplicationStyles.h"

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
        [[[CCIApplicationStyles instance] blackColor] setStroke];
        [[[CCIApplicationStyles instance] darkPurpleColor] setFill];
        
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
        

        [[[CCIApplicationStyles instance] folderSelectedShadowColor] setStroke];
        
        NSBezierPath *shadowPath = [[NSBezierPath alloc] init];
        [shadowPath moveToPoint:NSMakePoint(29.5, 7.0)];
        [shadowPath lineToPoint:NSMakePoint(29.5, 24.0)];
        [shadowPath stroke];
        
        
        [[[CCIApplicationStyles instance] folderSelectedHighlightColor] setStroke];
        [[[CCIApplicationStyles instance] folderSelectedHighlightColor] setFill];
        
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
        [[[CCIApplicationStyles instance] blackColor] setStroke];
        [[[CCIApplicationStyles instance] lightPurpleColor] setFill];
        
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
        

        [[[CCIApplicationStyles instance] folderShadowColor] setStroke];
        
        NSBezierPath *shadowPath = [[NSBezierPath alloc] init];
        [shadowPath moveToPoint:NSMakePoint(29.5, 7.0)];
        [shadowPath lineToPoint:NSMakePoint(29.5, 24.0)];
        [shadowPath stroke];
        
        
        [[[CCIApplicationStyles instance] whiteColor] setStroke];
        
        NSBezierPath *highlightPath = [[NSBezierPath alloc] init];
        [highlightPath moveToPoint:NSMakePoint(1.0, 6.5)];
        [highlightPath lineToPoint:NSMakePoint(30.0, 6.5)];
        [highlightPath stroke];
        
        [[[CCIApplicationStyles instance] whiteColor] setFill];
        
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
    [self setSelectedState:YES];
    [self setNeedsDisplay:YES];
}

- (void)unselectFolder
{
    [self setSelectedState:NO];
    [self setNeedsDisplay:YES];
}

@end
