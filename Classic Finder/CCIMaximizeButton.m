//
//  CCIMaximizeButton.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
