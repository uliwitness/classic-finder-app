//
//  CCIClassicScrollView.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/20/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

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

@end
