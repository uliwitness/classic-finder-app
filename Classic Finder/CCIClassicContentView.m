//
//  CCIClassicContentView.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/19/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import "CCIClassicContentView.h"

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
