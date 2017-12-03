//
//  CCIClassicFileIcon.m
//  Classic Finder
//
//  Created by Ben Szymanski on 10/4/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import "CCIClassicFileIcon.h"

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
        [[NSColor whiteColor] setStroke];
        [[NSColor blackColor] setFill];
        
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
        [[NSColor blackColor] setStroke];
        [[NSColor whiteColor] setFill];
        
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
