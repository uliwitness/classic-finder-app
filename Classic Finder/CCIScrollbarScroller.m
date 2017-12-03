//
//  CCIScrollbarScroller.m
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

#import "CCIScrollbarScroller.h"

@interface CCIScrollbarScroller()

@property (nonatomic) ScrollerDirection direction;
@property (nonatomic) BOOL inactive;

@end

@implementation CCIScrollbarScroller

#pragma mark - CREATION METHODS
+ (instancetype)scrollerBoxAtPoint:(NSPoint)point
                withDirectionality:(ScrollerDirection)direction
{
    NSRect sbFrame = NSMakeRect(0.0, 0.0, 0.0, 0.0);
    
    if (direction == ScrollerVertical) {
        sbFrame = NSMakeRect(point.x, point.y, 14.0, 16.0);
    } else if (direction == ScrollerHorizontal) {
        sbFrame = NSMakeRect(point.x, point.y, 16.0, 14.0);
    }
    
    CCIScrollbarScroller *sb = [[CCIScrollbarScroller alloc] initWithFrame:sbFrame];
    
    [sb setDirection:direction];
    [sb setInactive:NO];
    
    return sb;
}

#pragma mark - DRAWING METHODS
- (void)moveScrollerBoxToPoint:(NSPoint)point
{
    NSRect sbFrame = NSMakeRect(0.0, 0.0, 0.0, 0.0);
    
    if (self.direction == ScrollerVertical) {
        sbFrame = NSMakeRect(point.x, point.y, 14.0, 16.0);
    } else if (self.direction == ScrollerHorizontal) {
        sbFrame = NSMakeRect(point.x, point.y, 16.0, 14.0);
    }
    
    [self setFrame:sbFrame];
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if ([self inactive]) {
        [[NSColor colorWithCalibratedRed:0.93
                                   green:0.93
                                    blue:0.93
                                   alpha:1.00] setFill];
        
        NSRect backgroundRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        NSRectFill(backgroundRect);
    } else {
        [self drawOutlineAndFill];
        [self drawTextureLines];
    }
}

- (void)drawOutlineAndFill
{
    if ([self direction] == ScrollerVertical) {
        NSColor *darkGrayBase = [NSColor colorWithCalibratedRed:0.33 green:0.33 blue:0.33 alpha:1.00];
        
        NSRect darkBaseFrame = NSMakeRect(0.0,
                                          0.0,
                                          self.frame.size.width,
                                          self.frame.size.height);
        
        [darkGrayBase setFill];
        NSRectFill(darkBaseFrame);
        
        
        NSColor *darkPurpleColor = [NSColor colorWithCalibratedRed:0.15
                                                             green:0.14
                                                              blue:0.31
                                                             alpha:1.0];
        
        NSRect darkPurpleFrame = NSMakeRect(0.0,
                                            1.0,
                                            self.frame.size.width,
                                            self.frame.size.height - 1.0);
        
        [darkPurpleColor setFill];
        NSRectFill(darkPurpleFrame);
        
        
        NSColor *lightPurpleColor = [NSColor colorWithCalibratedRed:0.76
                                                              green:0.76
                                                               blue:1.0
                                                              alpha:1.0];
        
        NSRect lightPurpleFrame = NSMakeRect(0.0,
                                             1.0,
                                             self.frame.size.width - 1.0,
                                             self.frame.size.height - 2.0);
        
        [lightPurpleColor setFill];
        NSRectFill(lightPurpleFrame);
        
        
        NSColor *midGrayColor = [NSColor colorWithCalibratedWhite:0.67
                                                            alpha:1.0];
        
        NSRect midGrayFrame = NSMakeRect(1.0,
                                         2.0,
                                         self.frame.size.width - 2.0,
                                         self.frame.size.height - 3.0);
        
        [midGrayColor setFill];
        NSRectFill(midGrayFrame);
    } else if ([self direction] == ScrollerHorizontal) {
        NSColor *darkGrayBase = [NSColor colorWithCalibratedRed:0.33 green:0.33 blue:0.33 alpha:1.00];
        
        NSRect darkBaseFrame = NSMakeRect(0.0,
                                          0.0,
                                          self.frame.size.width,
                                          self.frame.size.height);
        
        [darkGrayBase setFill];
        NSRectFill(darkBaseFrame);
        
        
        NSColor *darkPurpleColor = [NSColor colorWithCalibratedRed:0.15
                                                             green:0.14
                                                              blue:0.31
                                                             alpha:1.0];

        NSRect darkPurpleFrame = NSMakeRect(1.0,
                                            0.0,
                                            self.frame.size.width - 1.0,
                                            self.frame.size.height);

        [darkPurpleColor setFill];
        NSRectFill(darkPurpleFrame);


        NSColor *lightPurpleColor = [NSColor colorWithCalibratedRed:0.76
                                                              green:0.76
                                                               blue:1.0
                                                              alpha:1.0];

        NSRect lightPurpleFrame = NSMakeRect(1.0,
                                             0.0,
                                             self.frame.size.width - 2.0,
                                             self.frame.size.height - 1.0);

        [lightPurpleColor setFill];
        NSRectFill(lightPurpleFrame);


        NSColor *midGrayColor = [NSColor colorWithCalibratedWhite:0.67
                                                            alpha:1.0];

        NSRect midGrayFrame = NSMakeRect(2.0,
                                         1.0,
                                         self.frame.size.width - 3.0,
                                         self.frame.size.height - 2.0);

        [midGrayColor setFill];
        NSRectFill(midGrayFrame);
    }
}

- (void)drawTextureLines
{
    if ([self direction] == ScrollerVertical)
    {
        NSColor *lightPurpleColor = [NSColor colorWithCalibratedRed:0.76
                                                              green:0.76
                                                               blue:1.0
                                                              alpha:1.0];
        
        NSRect lightPurpleTextureLine1 = NSMakeRect(4.0, 4.0, 6.0, 1.0);
        NSRect lightPurpleTextureLine2 = NSMakeRect(4.0, 6.0, 6.0, 1.0);
        NSRect lightPurpleTextureLine3 = NSMakeRect(4.0, 8.0, 6.0, 1.0);
        NSRect lightPurpleTextureLine4 = NSMakeRect(4.0, 10.0, 6.0, 1.0);
        NSRect lightPurpleTextureLine5 = NSMakeRect(4.0, 12.0, 6.0, 1.0);
        
        [lightPurpleColor setFill];
        
        NSRectFill(lightPurpleTextureLine1);
        NSRectFill(lightPurpleTextureLine2);
        NSRectFill(lightPurpleTextureLine3);
        NSRectFill(lightPurpleTextureLine4);
        NSRectFill(lightPurpleTextureLine5);
        
        
        NSColor *lighterMidPurpleColor = [NSColor colorWithCalibratedRed:0.64 green:0.64 blue:0.84 alpha:1.00];
        
        NSRect lighterMidPurpleTextureLine = NSMakeRect(4.0, 3.0, 6.0, 1.0);
        
        [lighterMidPurpleColor setFill];
        
        NSRectFill(lighterMidPurpleTextureLine);
        
        
        
        NSColor *darkerMidPurpleColor = [NSColor colorWithCalibratedRed:0.40 green:0.40 blue:0.60 alpha:1.00];
        
        NSRect darkerMidPurpleTextureLine1 = NSMakeRect(4.0, 5.0, 6.0, 1.0);
        NSRect darkerMidPurpleTextureLine2 = NSMakeRect(4.0, 7.0, 6.0, 1.0);
        NSRect darkerMidPurpleTextureLine3 = NSMakeRect(4.0, 9.0, 6.0, 1.0);
        NSRect darkerMidPurpleTextureLine4 = NSMakeRect(4.0, 11.0, 6.0, 1.0);
        
        [darkerMidPurpleColor setFill];
        
        NSRectFill(darkerMidPurpleTextureLine1);
        NSRectFill(darkerMidPurpleTextureLine2);
        NSRectFill(darkerMidPurpleTextureLine3);
        NSRectFill(darkerMidPurpleTextureLine4);
    } else if ([self direction] == ScrollerHorizontal) {
        NSColor *lightPurpleColor = [NSColor colorWithCalibratedRed:0.76
                                                              green:0.76
                                                               blue:1.0
                                                              alpha:1.0];
        
        NSRect lightPurpleTextureLine1 = NSMakeRect(4.0, 4.0, 1.0, 6.0);
        NSRect lightPurpleTextureLine2 = NSMakeRect(6.0, 4.0, 1.0, 6.0);
        NSRect lightPurpleTextureLine3 = NSMakeRect(8.0, 4.0, 1.0, 6.0);
        NSRect lightPurpleTextureLine4 = NSMakeRect(10.0, 4.0, 1.0, 6.0);
        NSRect lightPurpleTextureLine5 = NSMakeRect(12.0, 4.0, 1.0, 6.0);
        
        [lightPurpleColor setFill];
        
        NSRectFill(lightPurpleTextureLine1);
        NSRectFill(lightPurpleTextureLine2);
        NSRectFill(lightPurpleTextureLine3);
        NSRectFill(lightPurpleTextureLine4);
        NSRectFill(lightPurpleTextureLine5);
        
        
        NSColor *lighterMidPurpleColor = [NSColor colorWithCalibratedRed:0.64 green:0.64 blue:0.84 alpha:1.00];
        
        NSRect lighterMidPurpleTextureLine = NSMakeRect(3.0, 4.0, 1.0, 6.0);
        
        [lighterMidPurpleColor setFill];
        
        NSRectFill(lighterMidPurpleTextureLine);
        
        
        
        NSColor *darkerMidPurpleColor = [NSColor colorWithCalibratedRed:0.40 green:0.40 blue:0.60 alpha:1.00];
        
        NSRect darkerMidPurpleTextureLine1 = NSMakeRect(5.0, 4.0, 1.0, 6.0);
        NSRect darkerMidPurpleTextureLine2 = NSMakeRect(7.0, 4.0, 1.0, 6.0);
        NSRect darkerMidPurpleTextureLine3 = NSMakeRect(9.0, 4.0, 1.0, 6.0);
        NSRect darkerMidPurpleTextureLine4 = NSMakeRect(11.0, 4.0, 1.0, 6.0);
        
        [darkerMidPurpleColor setFill];
        
        NSRectFill(darkerMidPurpleTextureLine1);
        NSRectFill(darkerMidPurpleTextureLine2);
        NSRectFill(darkerMidPurpleTextureLine3);
        NSRectFill(darkerMidPurpleTextureLine4);
    }
}

- (BOOL)isFlipped
{
    return YES;
}

@end
