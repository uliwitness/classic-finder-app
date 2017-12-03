//
//  CCIClassicFileIcon.m
//  Classic Finder
//
//  Created by Ben Szymanski on 10/4/17.
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

#import "CCIClassicFileIcon.h"
#import "CCIApplicationStyles.h"

@interface CCIClassicFileIcon()

@property BOOL selectedState;

@end

@implementation CCIClassicFileIcon

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
    
    if (self.selectedState)
    {
        [[[CCIApplicationStyles instance] whiteColor] setStroke];
        [[[CCIApplicationStyles instance] blackColor] setFill];
        
        NSBezierPath *fileShape = [[NSBezierPath alloc] init];
        [fileShape moveToPoint:NSMakePoint(18.0, 0.5)];
        [fileShape lineToPoint:NSMakePoint(0.5, 0.5)];
        [fileShape lineToPoint:NSMakePoint(0.5, 29.5)];
        [fileShape lineToPoint:NSMakePoint(22.5, 29.5)];
        [fileShape lineToPoint:NSMakePoint(22.5, 5.5)];
        [fileShape lineToPoint:NSMakePoint(18.0, 0.5)];
        
        [fileShape fill];
        
        NSBezierPath *pageFlapOutline = [[NSBezierPath alloc] init];
        [pageFlapOutline moveToPoint:NSMakePoint(18.0, 0.5)];
        [pageFlapOutline lineToPoint:NSMakePoint(18.0, 6.0)];
        [pageFlapOutline lineToPoint:NSMakePoint(23.0, 6.0)];
        
        [pageFlapOutline stroke];
    } else
    {
        [[[CCIApplicationStyles instance] blackColor] setStroke];
        [[[CCIApplicationStyles instance] whiteColor] setFill];
        
        NSBezierPath *outlinePath = [[NSBezierPath alloc] init];
        [outlinePath moveToPoint:NSMakePoint(18.0, 0.5)];
        [outlinePath lineToPoint:NSMakePoint(0.5, 0.5)];
        [outlinePath lineToPoint:NSMakePoint(0.5, 29.5)];
        [outlinePath lineToPoint:NSMakePoint(22.5, 29.5)];
        [outlinePath lineToPoint:NSMakePoint(22.5, 5.5)];
        [outlinePath lineToPoint:NSMakePoint(18.0, 0.5)];
        [outlinePath lineToPoint:NSMakePoint(18.0, 6.0)];
        [outlinePath lineToPoint:NSMakePoint(23.0, 6.0)];
        
        [outlinePath fill];
        [outlinePath stroke];
    }
}

- (BOOL)isFlipped
{
    return YES;
}

- (void)selectFile
{
    self.selectedState = YES;
    [self setNeedsDisplay:YES];
}

- (void)deselectFile
{
    self.selectedState = NO;
    [self setNeedsDisplay:YES];
}

@end
