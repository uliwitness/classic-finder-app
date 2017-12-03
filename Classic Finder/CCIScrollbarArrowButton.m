//
//  CCIScrollbarArrowButton.m
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

#import "CCIScrollbarArrowButton.h"
#import "CCIScrollbar.h"
#import "CCIApplicationStyles.h"

@interface CCIScrollbarArrowButton()

@property (nonatomic, strong) CCIScrollbar *scrollBar;

@property (nonatomic) BOOL inactive;
@property (nonatomic) BOOL clicking;

@end

@implementation CCIScrollbarArrowButton

#pragma mark - CREATION METHODS
+ (CCIScrollbarArrowButton *)buttonWithDirectionality:(ButtonDirectionality)direction
                                              atPoint:(NSPoint) point
                                  withParentScrollbar:(CCIScrollbar *)scrollBar
{
    NSRect defaultScrollButtonFrame = NSMakeRect(point.x, point.y, 14.0, 14.0);
    
    CCIScrollbarArrowButton *button = [[CCIScrollbarArrowButton alloc] initWithFrame:defaultScrollButtonFrame];
    [button setDirection:direction];
    [button setScrollBar:scrollBar];
    [button setInactive:NO];
    
    return button;
}

#pragma mark - UI EVENT METHODS
- (void)mouseDown:(NSEvent *)event
{
    [super mouseDown:event];
    
    [self setClicking:YES];
    [self setNeedsDisplay];
}

- (void)mouseUp:(NSEvent *)event
{
    [super mouseUp:event];
    
    [self setClicking:NO];
    [self setNeedsDisplay];
    
    // https://stackoverflow.com/questions/498175/custom-nscontrol-target-action-howto#comment4171079_500032
    [NSApp sendAction:[self action]
                   to:[self target]
                 from:self];
}

- (void)mouseExited:(NSEvent *)event
{
    [super mouseExited:event];
    
    self.clicking = NO;
    [self setNeedsDisplay];
}

#pragma mark - DRAWING METHODS
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if ([self inactive]) {
        [[NSColor colorWithWhite:1.0
                           alpha:1.0] setFill];
        
        NSRect backgroundRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        NSRectFill(backgroundRect);
    } else {
        [self drawBackground];
        [self drawHighlights];
        [self drawShadows];
        [self drawArrow];
    }
}

- (void)drawBackground
{
    NSRect backgroundRect = NSMakeRect(0.0,
                                       0.0,
                                       self.frame.size.width,
                                       self.frame.size.height);
    
    [[[CCIApplicationStyles instance] lightGrayColor] setFill];
    NSRectFill(backgroundRect);
}

- (void)drawHighlights
{
    NSBezierPath *leftEdgeHighlight = [[NSBezierPath alloc] init];
    [leftEdgeHighlight moveToPoint:NSMakePoint(0.5, 0.0)];
    [leftEdgeHighlight lineToPoint:NSMakePoint(0.5, self.frame.size.height)];
    
    NSBezierPath *topEdgeHighlight = [[NSBezierPath alloc] init];
    [topEdgeHighlight moveToPoint:NSMakePoint(0.0, 0.5)];
    [topEdgeHighlight lineToPoint:NSMakePoint(self.frame.size.width, 0.5)];
    
    [[[CCIApplicationStyles instance] whiteColor] setStroke];
    [leftEdgeHighlight stroke];
    [topEdgeHighlight stroke];
}

- (void)drawShadows
{
    NSBezierPath *rightEdgeShadow = [[NSBezierPath alloc] init];
    [rightEdgeShadow moveToPoint:NSMakePoint(self.frame.size.width - 0.5, self.frame.size.height)];
    [rightEdgeShadow lineToPoint:NSMakePoint(self.frame.size.width - 0.5, 0.0)];
    
    NSBezierPath *bottomEdgeShadow = [[NSBezierPath alloc] init];
    [bottomEdgeShadow moveToPoint:NSMakePoint(self.frame.size.width, self.frame.size.height - 0.5)];
    [bottomEdgeShadow lineToPoint:NSMakePoint(0.0, self.frame.size.height - 0.5)];
    
    // Shadow Color
    [[[CCIApplicationStyles instance] darkGrayColor] setStroke];
    [rightEdgeShadow stroke];
    [bottomEdgeShadow stroke];
}

- (void)drawArrow
{
    [NSGraphicsContext saveGraphicsState];
    
    NSAffineTransform *arrowDirectionRotation = [NSAffineTransform transform];
    [arrowDirectionRotation translateXBy:self.frame.size.width/2.0
                                     yBy:self.frame.size.height / 2.0];
    [arrowDirectionRotation rotateByDegrees:(90.0 * self.direction)];
    [arrowDirectionRotation translateXBy:-(self.frame.size.width/2.0)
                                     yBy:-(self.frame.size.height / 2.0)];
    [arrowDirectionRotation concat];
    
    NSBezierPath *arrowShape = [[NSBezierPath alloc] init];
    [arrowShape moveToPoint:NSMakePoint(1.5, 7.0)];
    [arrowShape lineToPoint:NSMakePoint(6.5, 2.0)];
    [arrowShape lineToPoint:NSMakePoint(11.5, 7.0)];
    [arrowShape lineToPoint:NSMakePoint(8.5, 7.0)];
    [arrowShape lineToPoint:NSMakePoint(8.5, 11.0)];
    [arrowShape lineToPoint:NSMakePoint(4.5, 11.0)];
    [arrowShape lineToPoint:NSMakePoint(4.5, 7.0)];
    [arrowShape lineToPoint:NSMakePoint(1.5, 7.0)];
    [arrowShape setLineWidth:1.0];
    
    if (self.clicking) {
        [[[CCIApplicationStyles instance] blackColor] setStroke];
        [[[CCIApplicationStyles instance] blackColor] setFill];
    } else {
        // Arrow Outline Stroke Color
        [[[CCIApplicationStyles instance] darkPurpleColor] setStroke];
        [[[CCIApplicationStyles instance] lightPurpleColor] setFill];
    }
    
    [arrowShape fill];
    [arrowShape stroke];
    
    [NSGraphicsContext restoreGraphicsState];
}

- (BOOL)isFlipped
{
    return YES;
}

@end