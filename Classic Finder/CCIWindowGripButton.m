//
//  CCIWindowGripButton.m
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/23/17.
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

#import "CCIWindowGripButton.h"
#import "CCIApplicationStyles.h"

@interface CCIWindowGripButton() {
    BOOL disabled;
    BOOL whiteOut;
}

@property (nonatomic) BOOL isClicked;

@end

@implementation CCIWindowGripButton

#pragma mark - INITIALIZATION METHODS

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        [self setIsClicked:NO];
        disabled = NO;
        whiteOut = NO;
    }
    
    return self;
}

#pragma mark - DRAWING STATE MODIFIERS
- (void)enableButton
{
    disabled = NO;
    whiteOut = NO;
    [self setNeedsDisplay:YES];
}

- (void)disableButton
{
    disabled = YES;
    whiteOut = NO;
    [self setNeedsDisplay:YES];
}

- (void)disableAndWhiteOutButton
{
    disabled = YES;
    whiteOut = YES;
    [self setNeedsDisplay:YES];
}

#pragma mark - DRAWING METHODS

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    if (disabled && whiteOut) {
        [[[CCIApplicationStyles instance] blackColor] setFill];
        
        NSRect backgroundRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        NSRectFill(backgroundRect);
        
        [[[CCIApplicationStyles instance] whiteColor] setFill];
        
        NSRect whiteRect = NSMakeRect(1.0,
                                      1.0,
                                      self.frame.size.width - 1.0,
                                      self.frame.size.height - 1.0);
        NSRectFill(whiteRect);
    } else {
        [[[CCIApplicationStyles instance] blackColor] setFill];
        
        NSRect blackFrameRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        NSRectFill(blackFrameRect);
        
        [[[CCIApplicationStyles instance] lightGrayColor] setFill];
        
        NSRect backgroundRect = NSMakeRect(1.0,
                                           1.0,
                                           self.frame.size.width - 1.0,
                                           self.frame.size.height - 1.0);
        NSRectFill(backgroundRect);
        
        [[[CCIApplicationStyles instance] darkPurpleColor] setFill];
        NSRectFill(NSMakeRect(4.0, 4.0, 9.0, 9.0));
        
        [[[CCIApplicationStyles instance] lightPurpleColor] setFill];
        NSRectFill(NSMakeRect(5.0, 5.0, 8.0, 8.0));
        
        [[[CCIApplicationStyles instance] darkPurpleColor] setFill];
        NSRectFill(NSMakeRect(6.0, 6.0, 7.0, 7.0));
        
        [[[CCIApplicationStyles instance] midGrayColor] setFill];
        NSRectFill(NSMakeRect(6.0, 6.0, 6.0, 6.0));
        
        //small suqare
        [[[CCIApplicationStyles instance] darkPurpleColor] setFill];
        NSRectFill(NSMakeRect(3.0, 3.0, 6.0, 6.0));
        
        [[[CCIApplicationStyles instance] lightPurpleColor] setFill];
        NSRectFill(NSMakeRect(4.0, 4.0, 5.0, 5.0));
        
        [[[CCIApplicationStyles instance] darkPurpleColor] setFill];
        NSRectFill(NSMakeRect(5.0, 5.0, 4.0, 4.0));
        
        [[NSColor colorWithCalibratedRed:0.73
                                   green:0.73
                                    blue:0.73
                                   alpha:1.00] setFill];
        NSRectFill(NSMakeRect(5.0, 5.0, 3.0, 3.0));
    }
}

- (BOOL)isFlipped
{
    return YES;
}

@end
