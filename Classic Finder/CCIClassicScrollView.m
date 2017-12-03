//
//  CCIClassicScrollView.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/20/17.
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

#import "CCIClassicScrollView.h"

@implementation CCIClassicScrollView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSColor *blackColor = [NSColor colorWithCalibratedWhite:0.0
                                                      alpha:1.0];
    [blackColor setFill];
    NSRectFill(NSMakeRect(0.0,
                          0.0,
                          self.frame.size.width,
                          self.frame.size.height));
    
    NSColor *whiteColor = [NSColor colorWithCalibratedWhite:1.0
                                                      alpha:1.0];
    [whiteColor setFill];
    NSRectFill(NSMakeRect(1.0,
                          0.0,
                          self.frame.size.width - 2.0,
                          2.0));
    NSRectFill(NSMakeRect(1.0,
                          3.0,
                          self.frame.size.width - 2.0,
                          self.frame.size.height - 4.0));
}

- (BOOL)isFlipped
{
    return YES;
}

- (BOOL)acceptsFirstResponder
{
    return YES;
}

- (BOOL)resignFirstResponder
{
    return YES;
}

- (void)keyDown:(NSEvent *)event
{
    NSLog(@"%@", [event characters]);
}

@end
