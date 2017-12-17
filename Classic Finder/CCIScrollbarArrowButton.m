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

@interface CCIScrollbarArrowButton() {
    BOOL disabled;
    BOOL whiteOut;
}

@property (nonatomic, strong) CCIScrollbar *scrollBar;
@property (nonatomic) BOOL clicking;

@end

@implementation CCIScrollbarArrowButton

#pragma mark - CREATION METHODS
+ (CCIScrollbarArrowButton *)buttonWithDirectionality:(ButtonDirectionality)direction
                                              atPoint:(NSPoint) point
                                  withParentScrollbar:(CCIScrollbar *)scrollBar
{
    NSRect defaultScrollButtonFrame = NSMakeRect(point.x, point.y, 16.0, 16.0);

    CCIScrollbarArrowButton *button = [[CCIScrollbarArrowButton alloc] initWithFrame:defaultScrollButtonFrame];
    [button setDirection:direction];
    [button setScrollBar:scrollBar];
    
    return button;
}

#pragma mark - UI EVENT METHODS
- (void)mouseDown:(NSEvent *)event
{
    if (!disabled) {
        [super mouseDown:event];
        
        [self setClicking:YES];
        [self setNeedsDisplay];
    }
}

- (void)mouseUp:(NSEvent *)event
{
    if (!disabled) {
        [super mouseUp:event];
        
        [self setClicking:NO];
        [self setNeedsDisplay];
        
        // https://stackoverflow.com/questions/498175/custom-nscontrol-target-action-howto#comment4171079_500032
        [NSApp sendAction:[self action]
                       to:[self target]
                     from:self];
    }
}

- (void)mouseExited:(NSEvent *)event
{
    if (!disabled) {
        [super mouseExited:event];
        
        self.clicking = NO;
        [self setNeedsDisplay];
    }
}

#pragma mark - DRAWING METHOD MODIFIER METHODS
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
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if (disabled && !whiteOut) {
        [self drawBackground];
        
        [[[CCIApplicationStyles instance] midGrayColor] setStroke];
        
        NSBezierPath *outlinePath = [[NSBezierPath alloc] init];
        
        if ([self direction] == Up) {
            [outlinePath moveToPoint:NSMakePoint(0.0, self.frame.size.height)];
            [outlinePath lineToPoint:NSMakePoint(self.frame.size.width, self.frame.size.height)];
        } else if ([self direction] == Down) {
            [outlinePath moveToPoint:NSMakePoint(0.0, 0.0)];
            [outlinePath lineToPoint:NSMakePoint(self.frame.size.width, 0.0)];
        } else if ([self direction] == Right) {
            [outlinePath moveToPoint:NSMakePoint(0.0, 0.0)];
            [outlinePath lineToPoint:NSMakePoint(0.0, self.frame.size.height)];
        } else if ([self direction] == Left) {
            [outlinePath moveToPoint:NSMakePoint(self.frame.size.width, 0.0)];
            [outlinePath lineToPoint:NSMakePoint(self.frame.size.width, self.frame.size.height)];
        }
        
        [outlinePath stroke];
        
        [self drawArrow];
    } else if (disabled && whiteOut) {
        [self drawBackground];
    } else {
        [self drawBackground];
//        [self drawHighlights];
//        [self drawShadows];
        [self drawArrow];
    }
}

- (void)drawBackground
{
    if (disabled && !whiteOut) {
        NSRect blackBackgroundRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        [[[CCIApplicationStyles instance] blackColor] setFill];
        NSRectFill(blackBackgroundRect);
        
        NSRect backgroundRect = NSMakeRect(1.0, 1.0, self.frame.size.width - 2.0, self.frame.size.height - 2.0);
        [[[CCIApplicationStyles instance] lightGrayColor] setFill];
        NSRectFill(backgroundRect);
    } else if (disabled && whiteOut) {
        NSRect blackBackgroundRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        [[[CCIApplicationStyles instance] blackColor] setFill];
        NSRectFill(blackBackgroundRect);
    
        NSRect whiteBackgroundRect;
        
        if (self.direction == Up) {
            whiteBackgroundRect = NSMakeRect(1.0, 1.0, self.frame.size.width - 2.0, self.frame.size.height - 1.0);
        } else if (self.direction == Down) {
            whiteBackgroundRect = NSMakeRect(1.0, 0.0, self.frame.size.width - 2.0, self.frame.size.height - 1.0);
        } else if (self.direction == Left) {
            whiteBackgroundRect = NSMakeRect(1.0, 1.0, self.frame.size.width - 1.0, self.frame.size.height - 2.0);
        } else {
            whiteBackgroundRect = NSMakeRect(0.0, 1.0, self.frame.size.width - 1.0, self.frame.size.height - 2.0);
        }
        
        [[[CCIApplicationStyles instance] whiteColor] setFill];
        NSRectFill(whiteBackgroundRect);
    } else {
        NSRect blackBackgroundRect = NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
        [[[CCIApplicationStyles instance] blackColor] setFill];
        NSRectFill(blackBackgroundRect);
        
        NSRect shadowBackgroundRect = NSMakeRect(1.0, 1.0, self.frame.size.width - 2.0, self.frame.size.height - 2.0);
        [[[CCIApplicationStyles instance] darkGrayColor] setFill];
        NSRectFill(shadowBackgroundRect);
        
        NSRect highlightBackgroundRect = NSMakeRect(1.0, 1.0, self.frame.size.width - 3.0, self.frame.size.height - 3.0);
        [[[CCIApplicationStyles instance] whiteColor] setFill];
        NSRectFill(highlightBackgroundRect);
        
        NSRect buttonBackgroundRect = NSMakeRect(2.0, 2.0, self.frame.size.width - 4.0, self.frame.size.height - 4.0);
        [[[CCIApplicationStyles instance] lightGrayColor] setFill];
        NSRectFill(buttonBackgroundRect);
    }
    
    
}

- (void)drawArrow
{
    if (disabled && !whiteOut) {
        [NSGraphicsContext saveGraphicsState];
        
        NSAffineTransform *arrowDirectionRotation = [NSAffineTransform transform];
        [arrowDirectionRotation translateXBy:self.frame.size.width/2.0
                                         yBy:self.frame.size.height / 2.0];
        [arrowDirectionRotation rotateByDegrees:(90.0 * self.direction)];
        [arrowDirectionRotation translateXBy:-(self.frame.size.width/2.0)
                                         yBy:-(self.frame.size.height / 2.0)];
        [arrowDirectionRotation concat];
        
        NSBezierPath *arrowShape = [[NSBezierPath alloc] init];
        [arrowShape moveToPoint:NSMakePoint(3.0, 8.5)];
        [arrowShape lineToPoint:NSMakePoint(8.0, 3.5)];
        [arrowShape lineToPoint:NSMakePoint(13.0, 8.5)];
        [arrowShape lineToPoint:NSMakePoint(10.0, 8.5)];
        [arrowShape lineToPoint:NSMakePoint(10.0, 12.5)];
        [arrowShape lineToPoint:NSMakePoint(6.0, 12.5)];
        [arrowShape lineToPoint:NSMakePoint(6.0, 8.5)];
        [arrowShape lineToPoint:NSMakePoint(3.0, 8.5)];
        [arrowShape setLineWidth:1.0];
        
        [[[CCIApplicationStyles instance] midGrayColor] setStroke];
        [[[CCIApplicationStyles instance] lightGrayColor] setFill];
        
        [arrowShape fill];
        [arrowShape stroke];
        
        [NSGraphicsContext restoreGraphicsState];
    } else if (disabled && whiteOut) {
        // Draw no arrow
    } else {
        [NSGraphicsContext saveGraphicsState];
        
        NSAffineTransform *arrowDirectionRotation = [NSAffineTransform transform];
        [arrowDirectionRotation translateXBy:self.frame.size.width/2.0
                                         yBy:self.frame.size.height / 2.0];
        [arrowDirectionRotation rotateByDegrees:(90.0 * self.direction)];
        [arrowDirectionRotation translateXBy:-(self.frame.size.width/2.0)
                                         yBy:-(self.frame.size.height / 2.0)];
        [arrowDirectionRotation concat];
        
        NSBezierPath *arrowShape = [[NSBezierPath alloc] init];
        [arrowShape moveToPoint:NSMakePoint(3.0, 8.5)];
        [arrowShape lineToPoint:NSMakePoint(8.0, 3.5)];
        [arrowShape lineToPoint:NSMakePoint(13.0, 8.5)];
        [arrowShape lineToPoint:NSMakePoint(10.0, 8.5)];
        [arrowShape lineToPoint:NSMakePoint(10.0, 12.5)];
        [arrowShape lineToPoint:NSMakePoint(6.0, 12.5)];
        [arrowShape lineToPoint:NSMakePoint(6.0, 8.5)];
        [arrowShape lineToPoint:NSMakePoint(3.0, 8.5)];
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
}

- (BOOL)isFlipped
{
    return YES;
}

@end
