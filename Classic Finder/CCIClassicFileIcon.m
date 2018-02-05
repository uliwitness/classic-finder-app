//
//  CCIClassicFileIcon.m
//  Classic Finder
//
//  Created by Ben Szymanski on 10/4/17.
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
