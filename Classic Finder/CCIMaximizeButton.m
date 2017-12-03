//
//  CCIMaximizeButton.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
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

#import "CCIMaximizeButton.h"
#import "CCIApplicationStyles.h"

@interface CCIMaximizeButton ()

@property BOOL isClicked;

@end

@implementation CCIMaximizeButton

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    [[[CCIApplicationStyles instance] lightGrayColor] setFill];
    NSRectFill(NSMakeRect(0.0, 0.0, 13.0, 11.0));
    
    [[[CCIApplicationStyles instance] darkPurpleColor] setFill];
    NSRectFill(NSMakeRect(1.0, 0.0, 11.0, 11.0));
    
    if (self.isClicked) {
        [[[CCIApplicationStyles instance] clickedLightPurpleColor] setFill];
        NSRectFill(NSMakeRect(2.0, 0.0, 10.0, 10.0));
        
        [[[CCIApplicationStyles instance] clickedDarkPurpleColor] setFill];
        NSRectFill(NSMakeRect(3.0, 1.0, 8.0, 8.0));
        
        [[[CCIApplicationStyles instance] clickedMidGrayColor] setFill];
        NSRectFill(NSMakeRect(3.0, 2.0, 7.0, 7.0));
        
        [[[CCIApplicationStyles instance] clickedDarkPurpleColor] setFill];
        NSRectFill(NSMakeRect(3.0, 4.0, 5.0, 5.0));
        
        [[[CCIApplicationStyles instance] clickedMidGrayColor] setFill];
        NSRectFill(NSMakeRect(3.0, 5.0, 4.0, 4.0));
    } else {
        [[[CCIApplicationStyles instance] lightPurpleColor] setFill];
        NSRectFill(NSMakeRect(2.0, 0.0, 10.0, 10.0));
        
        [[[CCIApplicationStyles instance] darkPurpleColor] setFill];
        NSRectFill(NSMakeRect(3.0, 1.0, 8.0, 8.0));
        
        [[[CCIApplicationStyles instance] midGrayColor] setFill];
        NSRectFill(NSMakeRect(3.0, 2.0, 7.0, 7.0));
        
        [[[CCIApplicationStyles instance] darkPurpleColor] setFill];
        NSRectFill(NSMakeRect(3.0, 4.0, 5.0, 5.0));
        
        [[[CCIApplicationStyles instance] midGrayColor] setFill];
        NSRectFill(NSMakeRect(3.0, 5.0, 4.0, 4.0));
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
