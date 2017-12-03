//
//  CCIScrollContentView.m
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/12/17.
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

#import "CCIScrollContentView.h"

@implementation CCIScrollContentView

//- (void)drawRect:(NSRect)dirtyRect {
//    [super drawRect:dirtyRect];
//    
//    NSUInteger iterationCount = 0;
//    for (NSUInteger y = 0; y < self.frame.size.height; y += 30)
//    {
//        if (iterationCount % 2 == 0) {
//            [[NSColor redColor] setFill];
//        } else {
//            [[NSColor whiteColor] setFill];
//        }
//        
//        NSRectFill(NSMakeRect(0, y, self.frame.size.width, (y + 30)));
//        
//        NSString *yPos = [NSString stringWithFormat:@"%ld", y];
//        [yPos drawAtPoint:NSMakePoint(2.0, (y + 2.0)) withAttributes:nil];
//        
//        iterationCount += 1;
//    }
//}

- (BOOL)isFlipped
{
    return YES;
}

@end
