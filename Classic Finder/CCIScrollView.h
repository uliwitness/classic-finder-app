//
//  CCIScrollView.h
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/12/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CCIScrollContentView;

@interface CCIScrollView : NSView

@property (nonatomic, strong) CCIScrollContentView *contentView;

- (void)performScrollAction:(id)sender;
- (void)resizeContentView:(NSRect)newFrame;

@end
