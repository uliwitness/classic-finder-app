//
//  CCIScrollContentView.m
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/12/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import "CCIScrollContentView.h"

@implementation CCIScrollContentView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSUInteger iterationCount = 0;
    for (NSUInteger y = 0; y < self.frame.size.height; y += 30)
    {
        if (iterationCount % 2 == 0) {
            [[NSColor redColor] setFill];
        } else {
            [[NSColor whiteColor] setFill];
        }
        
        NSRectFill(NSMakeRect(0, y, self.frame.size.width, (y + 30)));
        
        NSString *yPos = [NSString stringWithFormat:@"%ld", y];
        [yPos drawAtPoint:NSMakePoint(2.0, (y + 2.0)) withAttributes:nil];
        
        iterationCount += 1;
    }
}

- (BOOL)isFlipped
{
    return YES;
}

@end
