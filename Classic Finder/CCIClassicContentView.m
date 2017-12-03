//
//  CCIClassicContentView.m
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

#import "CCIClassicContentView.h"
#import "CCIApplicationStyles.h"

@implementation CCIClassicContentView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect viewFrame = self.frame;
    
    [NSColor colorWithCalibratedWhite:0.0
                                alpha:1.0];
    
    NSRectFill(NSMakeRect(1.0,
                          1.0,
                          viewFrame.size.width - 1.0,
                          viewFrame.size.height - 1.0));
    
    
    [NSColor colorWithCalibratedWhite:1.0
                                alpha:1.0];
    
    NSRectFill(NSMakeRect(0.0,
                          0.0,
                          viewFrame.size.width - 1.0,
                          viewFrame.size.height - 1.0));
}

- (NSRect)contentArea
{
    NSRect contentFrame = NSMakeRect(0.0,
                                     0.0,
                                     self.frame.size.width - 1.0,
                                     self.frame.size.height - 1.0);
    
    return contentFrame;
}

- (BOOL)isFlipped
{
    return YES;
}

@end
